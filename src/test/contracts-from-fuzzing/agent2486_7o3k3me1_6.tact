struct ManyFields {
 x1: Int;
 x2: Bool;
 x3: String;
 x4: Int?;
 x5: Bool?;
 x6: String?;
 x7: Int;
 x8: Bool;
 x9: String;
 x10: Int;
}

contract StoreStruct {
 data: ManyFields = ManyFields{
 x1: 1,
 x2: false,
 x3: "str",
 x4: null,
 x5: true,
 x6: null,
 x7: 7,
 x8: true,
 x9: "nine",
 x10: 10
 };
}