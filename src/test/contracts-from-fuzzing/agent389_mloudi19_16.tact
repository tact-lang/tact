struct Inner {
  x: Int?;
  y: Bool?;
}

struct Outer {
  a: Int?;
  b: String?;
  c: Cell?;
  nested: Inner;
}

contract NestedManyOptional {
  st: Outer;

  init() {
    self.st = Outer{
      a:null, b:null, c:null,
      nested: Inner{x:null, y:null}
    };
  }
}
