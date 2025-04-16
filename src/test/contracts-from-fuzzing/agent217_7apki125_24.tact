struct Data { 
  boolOpt: Bool?; 
  intOpt: Int?;
}

contract OptInit {
  d: Data;

  init() {
    self.d = Data{
      boolOpt: null,
      intOpt: null
    };
  }
}