struct AllOptional {
  a:Int?; b:Int?; c:Int?; d:Int?; e:Int?;
}

contract InitNulls {
  f: AllOptional;

  init() {
    self.f = AllOptional{a:null,b:null,c:null,d:null,e:null};
  }
}