struct X { a:Int; }
struct Y { b:Int; }
struct Z { c:Int; }

struct Combo {
  x:X;
  y:Y;
  z:Z;
  flag:Bool;
  text:String?;
}

contract TestContract {
  dat:Combo;

  init() {
    self.dat = Combo{
      x:X{a:1},
      y:Y{b:2},
      z:Z{c:3},
      flag:true,
      text:"hello"
    };
  }
}