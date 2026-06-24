struct DeepNested {
  i: Int;
  b: Bool;
}

struct Middle {
  dn: DeepNested;
  comment: String;
}

struct Top {
  m1: Middle;
  m2: Middle;
  label: String;
}

contract DeeplyNested {
  data: Top;

  init() {
    self.data = Top{
      m1: Middle{
        dn: DeepNested{i: 1, b: true},
        comment: "a"
      },
      m2: Middle{
        dn: DeepNested{i: 2, b: false},
        comment: "b"
      },
      label: "top"
    };
  }
}
