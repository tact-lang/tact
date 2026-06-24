contract LargePersistentWithOptionals {
  i1:Int?; i2:Int?; i3:Int?; i4:Int?; i5:Int?;
  b1:Bool?; b2:Bool?; b3:Bool?; b4:Bool?; b5:Bool?;
  s1:String?; s2:String?; s3:String?; s4:String?; s5:String?;

  init() {
    self.i1=1; self.i2=null; self.i3=3; self.i4=null; self.i5=5;
    self.b1=true; self.b2=null; self.b3=false; self.b4=null; self.b5=true;
    self.s1="x"; self.s2=null; self.s3="y"; self.s4=null; self.s5="z";
  }
}