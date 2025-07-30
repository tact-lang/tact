struct SOpt {
    s: Inner?;
}

struct Inner {
    val: Int;
}

contract Test30 {
    so: SOpt?;
    flag: Bool;

    init() {
        self.so = null;
        self.flag = false;
    }
}
