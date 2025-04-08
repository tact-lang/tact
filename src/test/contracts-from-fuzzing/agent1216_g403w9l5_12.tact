struct NestedOpts {
  a: Int?;
  b: Bool?;
  c: String;
}

struct Container {
  x: NestedOpts;
  y: NestedOpts;
}

contract OptContainerTest {
  c: Container;

  init() {
    self.c = Container{
      x: NestedOpts{ a:null, b:true, c:"x" },
      y: NestedOpts{ a:42, b:null, c:"y" },
    };
  }
}