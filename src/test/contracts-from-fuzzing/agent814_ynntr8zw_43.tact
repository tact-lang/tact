// very wide contract with dozens of persistent fields with mixed optionals/defaults
contract SuperWide {
  a:Int;b:Int;c:Int;d:Int;e:Int;f:Int;g:Int;h:Int;i:Int;j:Int;
  k:Int;l:Int;m:Int;n:Int;o:Int;p:Int;q:Int;r:Int;s:Int;t:Int;
  u:Int;v:Int;w:Int;x:Int;y:Int;z:Int;

  aa:Int?; bb:Int?; cc:Int?; dd:Int?; ee:Int?; ff:Int?; gg:Int?; hh:Int?; ii:Int?; jj:Int?;

  b1:Bool;b2:Bool;b3:Bool;b4:Bool;b5:Bool;b6:Bool;b7:Bool;b8:Bool;b9:Bool;b10:Bool;

  s1:String;s2:String;s3:String;s4:String;s5:String;s6:String;s7:String;s8:String;s9:String;s10:String;

  init() {
    self.a=1;self.b=2;self.c=3;self.d=4;self.e=5;self.f=6;self.g=7;self.h=8;self.i=9;self.j=10;
    self.k=11;self.l=12;self.m=13;self.n=14;self.o=15;self.p=16;self.q=17;self.r=18;self.s=19;self.t=20;
    self.u=21;self.v=22;self.w=23;self.x=24;self.y=25;self.z=26;

    self.aa=null; self.bb=null; self.cc=null; self.dd=null; self.ee=null; self.ff=null; self.gg=null; self.hh=null; self.ii=null; self.jj=null;

    self.b1=true;self.b2=false;self.b3=true;self.b4=false;self.b5=true;self.b6=false;self.b7=true;self.b8=false;self.b9=true;self.b10=false;

    self.s1="a";self.s2="b";self.s3="c";self.s4="d";self.s5="e";self.s6="f";self.s7="g";self.s8="h";self.s9="i";self.s10="j";
  }
}
