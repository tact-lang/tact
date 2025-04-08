struct OptPrim {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract AllOptional {
  field: OptPrim;

  init() {
    self.field = OptPrim{a:null,b:null,c:null};
  }
}