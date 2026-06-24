struct OptStruct {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Slice?;
  f: Address?;
}

contract StructWithAllOptional {
  s: OptStruct = OptStruct{
    a:null,b:null,c:null,d:null,e:null,f:null
  };
}