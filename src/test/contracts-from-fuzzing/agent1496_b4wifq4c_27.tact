struct ComposeOpt {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract OptDefaultNested {
  s: ComposeOpt = ComposeOpt{x:null,y:null,z:"hello"};

  init() {
    self.s = ComposeOpt{x:null,y:true,z:"world"};
  }
}