struct ManyBools {
  flag1: Bool;
  flag2: Bool;
  flag3: Bool;
  flag4: Bool;
  flag5: Bool;
  flag6: Bool;
}

contract BoolFlags {
  flags: ManyBools;

  init() {
    self.flags = ManyBools{
      flag1:true,flag2:false,flag3:true,
      flag4:false,flag5:true,flag6:false
    };
  }
}
