struct DeepNested {
  a: Int;
  b: Int?;  
}

struct Middle {
  inner: DeepNested;
}

struct Top {
  value: Middle;
  tag: Bool?;
}

contract DeepOptional {
  st: Top = Top{
    value: Middle{ inner: DeepNested{ a: 1, b: null } },
    tag: null
  };

  init() {}
}