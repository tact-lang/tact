struct Deep {
    inner: Inner;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract TestContract {
    deep: Deep;

    init() {
        self.deep = Deep{ inner: Inner{ val: 42, flag: true } };
    }
}