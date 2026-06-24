struct C1 { f:Int;}
struct C2 { c:C1;}
struct C3 { c:C2;}
contract CI {
 v:C3;
 init() {
  self.v = C3{ c: C2{ c: C1{ f:314 } } };
 }
}