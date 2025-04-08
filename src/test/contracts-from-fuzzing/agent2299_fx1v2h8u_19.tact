struct NestedOptStruct {
  inn: Int?;
  ver: Bool;
}

contract OptionalDefaultVal {
  val: NestedOptStruct = NestedOptStruct{
    inn: null,
    ver: false,
  };
}