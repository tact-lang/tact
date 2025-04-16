struct Deep {
    val: Int;
    optInner: Inner?;
}

struct Inner {
    name: String;
    flag: Bool?;
}

contract TestContract {
    d: Deep;

    init() {
        self.d = Deep{ val: 1, optInner: null };
    }
}
