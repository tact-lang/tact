struct Inner {
  x: Int;
  y: Bool?;
}

struct Mix {
  i: Int;
  b: Bool;
  s: String;
  oInt: Int?;
  oStr: String?;
  nested: Inner;
}

contract MixStorage {
  data: Mix = Mix{
    i: 10,
    b: true,
    s: "test",
    oInt: null,
    oStr: "non-null",
    nested: Inner{ x: 5, y: null }
  };
}