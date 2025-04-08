struct Inner {
    value: Int;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: null
        };
    }

    receive() {
        let _ = self.data.middle;
    }
}