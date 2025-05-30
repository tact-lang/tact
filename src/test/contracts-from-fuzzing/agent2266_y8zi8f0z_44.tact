struct Leaf { v: Int }

struct Mid { 
    optLeaf: Leaf?; 
}

struct Outer { 
    mid: Mid?; 
}

contract Test {
    big: Outer;
    init() {
        self.big = Outer{
            mid: Mid {
                optLeaf: Leaf { v: 42 }
            }
        };
    }
}
