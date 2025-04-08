struct MidNested {
  val:Int;
}

contract ArrayOfNested {
  s1:MidNested; s2:MidNested; s3:MidNested; s4:MidNested; s5:MidNested;

  init() {
    self.s1 = MidNested{ val:1 };
    self.s2 = MidNested{ val:2 };
    self.s3 = MidNested{ val:3 };
    self.s4 = MidNested{ val:4 };
    self.s5 = MidNested{ val:5 };
  }
}