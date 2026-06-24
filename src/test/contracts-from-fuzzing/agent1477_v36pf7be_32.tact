struct Inner {
  a: Int;
  b: Bool;
  c: String;
}

struct Middle {
  f: Inner;
}

struct Outer {
  g: Middle;
}

contract MultiNest {
  st: Outer;

  init() {
    self.st = Outer{g: Middle{f: Inner{a:1,b:true,c:"t"}}};
  }
}