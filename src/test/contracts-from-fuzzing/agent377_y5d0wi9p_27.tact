struct InnerStruct {
 a: Int;
}

contract StructWithDefault {
 s: InnerStruct = InnerStruct{a: 42};
}