struct InnerStruct {
  a: Int;
  b: Bool;
}

contract StructInContract {
  s: InnerStruct = InnerStruct{ a: 5, b: true };
}