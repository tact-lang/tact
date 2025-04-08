struct Lvl1 {a:Int}
struct Lvl2 {b:Lvl1}
struct Lvl3 {c:Lvl2}
struct Lvl4 {d:Lvl3}

contract TestContract {
  big:Lvl4;
  a:Int; b:Bool; c:String;
  d:Int?; e:Bool?; f:String?;

  init() {
    self.big = Lvl4{d:Lvl3{c:Lvl2{b:Lvl1{a:5}}}};
    self.a=1; self.b=true; self.c="hi";
    self.d=null; self.e=false; self.f="yo";
  }
}