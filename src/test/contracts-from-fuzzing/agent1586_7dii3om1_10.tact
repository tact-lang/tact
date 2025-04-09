struct Inner {
    x: Int;
}

struct Mid {
    inner: Inner?;
}

struct Outer {
    mid: Mid?;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = Outer{
            mid: null
        };
    }

    receive() {}
}