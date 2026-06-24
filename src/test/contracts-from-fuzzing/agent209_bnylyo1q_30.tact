struct ManyFields {
  f1: Int;
  f2: Int?;
  f3: Bool;
  f4: Bool?;
  f5: Int;
  f6: Int?;
  f7: Bool;
  f8: Bool?;
  f9: Int;
  f10: Int?;
}

contract TestContract {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      f1:1,f2:null,f3:true,f4:null,f5:5,f6:null,f7:false,f8:true,f9:9,f10:null
    };
  }
}