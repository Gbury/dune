Building the executable generated by the MDX stanza fails when implicit
transitive dependencies are disabled due to an implicit dependency on the
`mdx.top` library:

  $ cat >dune-project <<EOF
  > (lang dune 3.0)
  > (using mdx 0.2)
  > (implicit_transitive_deps false)
  > EOF

  $ cat >dune <<EOF
  > (mdx)
  > EOF

  $ dune build
  File "mdx_gen.ml-gen", line 28, characters 2-19:
  28 |   Mdx_top.Directory path) []
         ^^^^^^^^^^^^^^^^^
  Error: Unbound module Mdx_top
  [1]

Adding `mdx.top` as an explicit dependency of the stanza fixes the issue:

  $ cat >dune <<EOF
  > (mdx
  >  (files markdown_file.md)
  >  (libraries mdx.top))
  > EOF

  $ dune build

