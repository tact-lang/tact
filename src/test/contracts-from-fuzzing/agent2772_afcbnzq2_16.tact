struct SequenceStruct {
  x1: Int;
  x2: Int;
  x3: Int;
}

contract SeqOverride {
  data: SequenceStruct;

  init() {
    self.data = SequenceStruct{x1:1,x2:2,x3:3};
    self.data.x1 = 10;
    self.data.x2 = 20;
    self.data.x3 = 30;
  }
}
