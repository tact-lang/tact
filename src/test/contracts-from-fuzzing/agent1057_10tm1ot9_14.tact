struct MinimalOptional {
  a: Int?;
}

contract TinyOpt {
  val: MinimalOptional;

  init() {
    self.val = MinimalOptional{a:null};
  }
}