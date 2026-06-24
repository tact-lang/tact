struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int as uint8;
    f6: Int as int16;
    f7: Bool?;
    f8: String;
    f9: Bool;
    f10: Int;
}

contract Test {
    state: ManyFields;
    
    init() {
      self.state = ManyFields{
        f1:1, f2:true, f3:"x", f4:myAddress(), f5:0, f6:0, f7:null, f8:"y", f9:false, f10:42
      };
    }
}