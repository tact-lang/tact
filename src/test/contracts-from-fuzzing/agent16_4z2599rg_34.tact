// Struct with many optional types defaulted null
struct ManyNullOpt {
  a:Int?=null; b:Bool?=null; c:String?=null; d:Address?=null;
  e:Cell?=null; f:Slice?=null; g:Builder?=null;
}

contract Test {
  m: ManyNullOpt = ManyNullOpt{};

  init() {}
}