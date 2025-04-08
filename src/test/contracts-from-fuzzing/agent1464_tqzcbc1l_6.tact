struct Inner {
    value: Int;
    flag: Bool;
}

struct Middle {
    inner: Inner;
}

contract TestContract {
    middle: Middle;

    init() {
        self.middle = Middle{
            inner: Inner{ value: 7, flag: true }
        };
    }
}