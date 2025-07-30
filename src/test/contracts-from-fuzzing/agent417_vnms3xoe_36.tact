struct Layer1 { a: Int; }
struct Layer2 { b: Layer1; }
struct Layer3 { c: Layer2; }

contract Layers {
   store: Layer3;

   init() {
     self.store = Layer3{
       c: Layer2{
         b: Layer1{
           a:123
         }
       }
     };
   }
}