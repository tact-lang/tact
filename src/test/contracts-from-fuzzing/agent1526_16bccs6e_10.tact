struct Inner {
    x: Int;
}

struct Middle {
    inn: Inner;
}

struct Outer {
    mid: Middle;
}

contract DeepChain {
    level: Outer;

    init() {
        self.level = Outer{ mid: Middle{ inn: Inner{x:10} } };
    }
}