struct InnerA { a:Int; }
struct InnerB { b:Bool; }
struct OuterAB {
 innerA:InnerA;
 innerB:InnerB;
}

contract MultiNest {
 data:OuterAB;
 init() {
   self.data=OuterAB{
     innerA:InnerA{a:1}, innerB:InnerB{b:true}
   };
 }
}