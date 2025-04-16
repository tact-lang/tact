struct ManyBool { b0: Bool; b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool; b6: Bool; b7: Bool; b8: Bool; b9: Bool; }

contract BoolPacking {
  flags: ManyBool;

  init() {
    self.flags = ManyBool {
      b0:true,b1:false,b2:true,b3:false,b4:true,b5:false,b6:true,b7:false,b8:true,b9:false
    };
  }
}