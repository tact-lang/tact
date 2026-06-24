struct BigNest {
  a: Int;
  b: OptInner;
  c: StructMid;
}

struct OptInner {
  x: Int?;
  y: Bool?;
}

struct StructMid {
  m: Int;
  n: InnerDeep;
}

struct InnerDeep {
  s: String;
}

contract HugeStruct {
  data: BigNest = BigNest{
    a: 1,
    b: OptInner{ x: null, y: null },
    c: StructMid{ m: 2, n: InnerDeep{ s: "yo" } }
  };
}