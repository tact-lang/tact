// Fuzzing extreme optional nesting with deep structs

struct InnerMost {
  val: Int;
}

struct Second {
  im: InnerMost?;
}

struct Third {
  sec: Second?;
}

contract NullMaze {
   fld: Third?;

   init() {
      self.fld = null;
   }
}
