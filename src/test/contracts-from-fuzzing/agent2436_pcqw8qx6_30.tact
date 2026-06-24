struct ManyBool {
  b1: Bool;
  b2: Bool;
  b3: Bool;
  b4: Bool;
  b5: Bool;
  b6: Bool;
  b7: Bool;
}

contract ManyBooleans {
  data: ManyBool;

  init() {
    self.data = ManyBool{
      b1:true,b2:false,b3:true,b4:true,b5:false,b6:true,b7:false
    };
  }
}