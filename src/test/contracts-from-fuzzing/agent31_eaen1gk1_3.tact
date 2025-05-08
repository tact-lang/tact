struct Inner {
    i: Int?;
    b: Bool?;
    s: String?;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    st: Outer;

    init() {
        self.st = Outer {
            inner: Inner { i: null, b: true, s: null },
            flag: true
        };
    }
}