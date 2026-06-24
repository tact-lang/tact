struct BigOne {
  a1: Int;
  a2: Bool;
  a3: Int;
  a4: String;
  a5: Int;
  a6: Bool?;
  a7: String;
  a8: Int?;
  a9: Bool;
  a10: String;
}

contract LargeStruct {
  s: BigOne = BigOne{
    a1: 1,
    a2: true,
    a3: 2,
    a4: "A",
    a5: 5,
    a6: null,
    a7: "B",
    a8: null,
    a9: false,
    a10: "C"
  };
}