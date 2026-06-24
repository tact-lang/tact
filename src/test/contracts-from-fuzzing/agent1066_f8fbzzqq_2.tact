struct Inner {
    val1: Int;
    val2: Bool?;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{inner: Inner{val1: 7, val2: null}, flag: false};
    }
}