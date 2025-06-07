struct X {
    val: Int;
}

struct Y {
    opt: X?;
}

contract OptChain {
    y: Y?;

    init() {
        self.y = null;
    }
}