struct Inner {
    x: Int;
    tail: Slice as remaining;
}

struct Outer {
    prefix: Int;
    nested: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            prefix: 11,
            nested: Inner{
                x: 22,
                tail: emptyCell().asSlice()
            }
        };
    }

    receive() {
        let _ = self.data.nested.x;
    }
}