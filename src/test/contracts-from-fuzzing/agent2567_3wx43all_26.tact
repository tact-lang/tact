struct Recursion1 { x: Int; y: Bool; }
struct Recursion2 { r1: Recursion1; }
struct Recursion3 { r2: Recursion2; }

contract RecursionContract {
  s: Recursion3;

  init() {
    self.s = Recursion3{r2: Recursion2{r1: Recursion1{x:5,y:true}}};
  }
}