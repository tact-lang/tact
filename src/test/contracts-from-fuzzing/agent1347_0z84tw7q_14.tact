struct Inner {
    id: Int;
    tail: Slice as remaining;
}

struct Outer {
    maybe: Inner?;
    count: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            maybe: null,
            count: 888
        };
    }
}