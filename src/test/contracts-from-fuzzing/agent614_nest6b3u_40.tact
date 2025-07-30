struct S {
  a: Int;
  b: String?;
  c: Bool;
}

contract SDefaultOpt {
  val: S? = null;

  init() {
    self.val = S{a:5,b:null,c:true};
  }
}