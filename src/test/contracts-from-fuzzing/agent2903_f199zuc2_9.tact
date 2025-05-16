struct BigNested {
  a: Int;
  b: Bool;
  c: String;
  opt: Int?;
  d: String;
  nested: InnerNested;
}

struct InnerNested {
  e: Int;
  f: Bool?;
  str: String;
}

contract Mix {
  data: BigNested = BigNested{
    a: 10,
    b: false,
    c: "hi",
    opt: null,
    d: "bye",
    nested: InnerNested{
      e: 5,
      f: true,
      str: "nest"
    }
  };
}