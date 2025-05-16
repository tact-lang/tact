contract AllTypes {
  i1:Int;
  b1:Bool;
  s1:String;
  c1:Cell;
  sl1:Slice;
  a1:Address;
  oi:Int?;
  ob:Bool?;
  os:String?;
  oc:Cell?;
  osl:Slice?;
  oa:Address?;

  init() {
    self.i1=1;
    self.b1=true;
    self.s1="foo";
    self.c1=emptyCell();
    self.sl1=emptyCell().asSlice();
    self.a1=myAddress();
    self.oi=null;
    self.ob=null;
    self.os=null;
    self.oc=null;
    self.osl=null;
    self.oa=null;
  }
}