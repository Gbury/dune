(** Menhir rules *)

open Stdune

(** Return the list of targets that are generated by this stanza. This
    list of targets is used by the code that computes the list of
    modules in the directory. *)
val targets : Dune_file.Menhir.t -> string list

(** Return the list of modules that are generated by this stanza. *)
val module_names : Dune_file.Menhir.t -> Module_name.t list

(** Generate the rules for a [(menhir ...)] stanza. *)
val gen_rules
  :  build_dir:Path.Build.t
  -> dir:Path.Build.t
  -> Compilation_context.t
  -> Dune_file.Menhir.t
  -> unit
