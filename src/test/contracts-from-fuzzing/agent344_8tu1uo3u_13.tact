struct ManyFieldsStruct {
  a: Int;
  b: Bool;
  c: Int;
  d: Int;
  e: Int;
  f: Int?;
  g: Bool?;
  h: Int;
  i: Int;
  j: String;
}

contract MixedFieldsConst {
  val: ManyFieldsStruct = ManyFieldsStruct{
    a: 1,
    b: true,
    c: 0,
    d: 0,
    e: 0,
    f: null,
    g: null,
    h: 0,
    i: 0,
    j: "hello",
  };
}