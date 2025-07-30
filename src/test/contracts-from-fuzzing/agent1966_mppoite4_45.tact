struct Lvl3 { a: Int; }
struct Lvl2 { l1: Lvl3; l2: Lvl3; }
struct Lvl1 { l: Lvl2; }

contract NestWidthAndDepth {
 s: Lvl1;

 init() {
   self.s = Lvl1{
     l: Lvl2{
       l1: Lvl3{a: 5},
       l2: Lvl3{a: 6}
     }
   };
 }
}
