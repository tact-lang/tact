struct Inner {
    x: Int? as uint16;
    flag: Bool?;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = Outer{ inner: null };
    }

    receive() {}
}