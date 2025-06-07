struct Pair {
  x: Int; y: Int;
}
struct Many {
  p1: Pair; p2: Pair; p3: Pair; p4: Pair; p5: Pair;
}
contract Test {
    state: Many;
    init() {
        self.state = Many{
            p1: Pair{x:1,y:1},
            p2: Pair{x:2,y:2},
            p3: Pair{x:3,y:3},
            p4: Pair{x:4,y:4},
            p5: Pair{x:5,y:5}
        };
    }
}
