struct Deep {
    z: Bool;
}

struct Middle {
    d: Deep;
}

struct Outer {
    mid: Middle;
}

contract ChainNested {
    val: Outer;

    init() {
        self.val = Outer{ mid: Middle{ d: Deep{ z: true } } };
    }
}