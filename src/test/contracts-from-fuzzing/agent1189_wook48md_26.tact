struct Many {
  a: Int;
  b: Bool;
  c: Int;
  d: Bool;
  e: Int;
  f: Bool;
}

contract ManuallyInit {
  st: Many;
  init() {
    self.st = Many{
      a:1, b:true, c:2, d:false, e:3, f:true
    };
  }
}