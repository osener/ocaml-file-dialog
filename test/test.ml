let () =
  match File_dialog.pick_folder () with
  | `Cancel -> Format.printf "Cancelled"
  | `Error s -> Format.printf "Error: %s" s
  | `Okay path -> Format.printf "Got %s" (Fpath.to_string path)
