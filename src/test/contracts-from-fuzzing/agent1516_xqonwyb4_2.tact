struct Child {
  x: Int;
  y: Bool;
  z: Int?;
}

struct Mid {
  child: Child;
  label: String;
}

struct Parent {
  mid: Mid;
  optionalLabel: String?;
}

contract TestNested {
  parent: Parent;

  init() {
    self.parent = Parent{
      mid: Mid{
        child: Child{
          x: 1,
          y: false,
          z: null
        },
        label: "hello"
      },
      optionalLabel: null
    };
  }
}