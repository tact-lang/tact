struct ChainOpt {
  n1: Int?;
  n2: Int?;
  n3: Int?;
  n4: Int?;
  n5: Int?;
}

contract Test {
  data: ChainOpt;
  init() {
    self.data = ChainOpt{
      n1:null, n2:null, n3:null, n4:null, n5:null
    };
  }
}