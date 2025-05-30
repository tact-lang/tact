struct Inner {
    x: Int as uint8;
    y: String = "abc";
}

struct Outer {
    inner: Inner?;
    flag: Bool;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = null;
    }
}