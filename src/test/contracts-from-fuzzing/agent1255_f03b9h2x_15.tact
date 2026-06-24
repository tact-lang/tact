struct Inner {
    x: Int;
    rem: Slice as remaining;
}

struct Outer {
    payload: Inner?;
}

contract Test15 {
    data: Outer;

    init() {
        self.data = Outer{
            payload: null,
        };
    }
}