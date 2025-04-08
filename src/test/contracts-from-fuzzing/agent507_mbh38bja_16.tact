struct S {
  a: Int;
  b: Bool;
  c: String;
}

contract Defaults {
  s: S;

  init() {
    self.s = S{
      a:0,
      b:false,
      c:"",
    };
  }
}
