struct InnerStruct {
  a: Int;
  b: Bool;
}

contract LargeDefaultAndNest {
  s1: InnerStruct = InnerStruct{a:5, b:false};
  s2: InnerStruct = InnerStruct{a:42, b:true};
}