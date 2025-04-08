struct ManyFields {
  f1: Int;
  f2: Bool;
  f3: Int;
  f4: Bool;
  f5: Int;
  f6: Bool;
  f7: Int;
  f8: Bool;
  f9: Int;
  f10: Bool;
  f11: Int;
  f12: Bool;
  f13: Int;
  f14: Bool;
  f15: Int;
  f16: Bool;
}

contract ManyFieldsTest {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      f1:1,f2:true,f3:1,f4:true,f5:1,f6:true,f7:1,f8:true,f9:1,f10:true,
      f11:1,f12:true,f13:1,f14:true,f15:1,f16:true
    };
  }
}