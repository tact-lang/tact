struct InnerA { a:Int; }
struct InnerB { b:Int; }
struct InnerC { c:Int; }
struct Holder {
  x:InnerA;
  y:InnerB;
  z:InnerC;
}

contract MultiStruct {
  h:Holder=Holder{ x:InnerA{a:1}, y:InnerB{b:2}, z:InnerC{c:3} };
}
