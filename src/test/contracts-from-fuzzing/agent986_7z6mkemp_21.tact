struct DeepOpt {
  l1: Int?;
  l2: Int?;
  l3: Int?;
  l4: Int?;
  l5: Int?;
}

contract ManyOptionals {
  d: DeepOpt;

  init() {
    self.d = DeepOpt{ l1:null, l2:null, l3:null, l4:null, l5:null };
  }
}
