struct Innermost {
    x: Int;
    s: String;
}

struct Middle {
    inner: Innermost;
    flag: Bool;
}

struct TopMost {
    mid: Middle;
    val: Int;
}

contract NestedMany {
    store: TopMost?;

    init() {
        self.store = null;
    }
}