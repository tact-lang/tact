contract DefaultsTest {
  a:Int=1; b:Int=2; c:Int=3;
  x:String="x"; y:String="y"; z:String="z";
  f:Bool=true; g:Bool=false;

  init() {
    self.a=10; self.b=20; self.c=30;
    self.x="xx"; self.y="yy"; self.z="zz";
    self.f=false; self.g=true;
  }
}