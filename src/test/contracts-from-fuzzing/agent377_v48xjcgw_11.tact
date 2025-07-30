struct Leaf {
  x: Int;
}

struct Mid {
  leaf: Leaf?;
}

contract TestContract {
    m: Mid?;

    init() {
        self.m = null;
    }
}