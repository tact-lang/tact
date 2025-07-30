struct ManyBools {
  b1: Bool;
  b2: Bool;
  b3: Bool;
  b4: Bool;
  b5: Bool;
  b6: Bool;
  b7: Bool;
  b8: Bool;
  b9: Bool;
  b10: Bool;
  b11: Bool;
  b12: Bool;
}

contract BoolStorage {
  flags: ManyBools;

  init() {
    self.flags = ManyBools{
      b1:false,b2:true,b3:false,b4:true,b5:true,b6:false,
      b7:true,b8:false,b9:false,b10:true,b11:true,b12:false
    };
  }
}