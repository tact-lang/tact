// Large contract with many persistent primitive typed fields
contract Wide {
  i1: Int;
  i2: Int;
  i3: Int;
  i4: Int;
  i5: Int;
  s1: String;
  s2: String;
  s3: String;
  s4: String;
  s5: String;
  b1: Bool;
  b2: Bool;
  b3: Bool;
  b4: Bool;
  b5: Bool;

  init() {
    self.i1=1;self.i2=2;self.i3=3;self.i4=4;self.i5=5;
    self.s1="a";self.s2="b";self.s3="c";self.s4="d";self.s5="e";
    self.b1=true;self.b2=false;self.b3=true;self.b4=false;self.b5=true;
  }
}