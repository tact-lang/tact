struct Mid {
    x: Int;
}

struct Container {
    val: Mid?;
}

contract DoubleOptionals {
    mid: Container?;

    init() {
        self.mid = null;
    }
}