struct Small {
    i: Int;
    flag: Bool;
}

struct Wrap {
    inner: Small?;
}

contract OptOpt {
    w: Wrap?;

    init() {
        self.w = null;
    }
}
