struct L {
 a: Int;
}
struct M {
 l1: L; l2: L; l3: L; l4: L;
 l5: L; l6: L; l7: L; l8: L;
}

contract MassNesting {
 big: M;
 init() {
  self.big = M{
   l1: L{a:1}, l2: L{a:2}, l3: L{a:3}, l4: L{a:4},
   l5: L{a:5}, l6: L{a:6}, l7: L{a:7}, l8: L{a:8}
  };
 }
}