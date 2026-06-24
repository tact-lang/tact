struct ManyOptionalFlags {
  flag1: Bool?;
  flag2: Bool?;
  flag3: Bool?;
  flag4: Bool?;
  flag5: Bool?;
  flag6: Bool?;
}

contract OptFlagsTest {
  f: ManyOptionalFlags;

  init() {
    self.f = ManyOptionalFlags{
      flag1:null,flag2:true,flag3:null,flag4:false,flag5:null,flag6:true
    };
  }
}
