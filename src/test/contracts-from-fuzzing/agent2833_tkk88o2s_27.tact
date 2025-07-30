struct SubSub {
  bar: Int;
}

struct Sub {
  subsub: SubSub;
}

struct Top {
  sub: Sub;
}

contract DeepDeeper {
  path: Top;

  init() {
    self.path = Top{
      sub: Sub{
        subsub: SubSub{bar:42}
      }
    };
  }
}