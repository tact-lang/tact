contract BigFlatInit {
  a:Int=11;
  b:Int=22;
  c:Int=33;
  d:Bool=true;
  e:String="xyz";
  f:Int?=null;
  g:Bool=false;
  h:String="abc";
  i:Int=99;
  j:Int?=100;

  init(){
    self.a=1;
    self.b=2;
    self.c=3;
    self.d=false;
    self.e="hi";
    self.f=5;
    self.g=true;
    self.h="bye";
    self.i=9;
    self.j=null;
  }
}