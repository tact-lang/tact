struct Layer1 { a: Int; }
struct Layer2 { b: Layer1; }
struct Layer3 { c: Layer2; }
struct Layer4 { d: Layer3; }

contract FourLayers {
 val: Layer4 = Layer4{
   d: Layer3{c: Layer2{b: Layer1{a: 5}}}
 };
}