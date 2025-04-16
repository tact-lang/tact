struct Inner {
    y: Int;
    rest: Slice as remaining;
}

struct Outer {
    foo: Int;
    nest: Inner;
}

contract Test39 {
    data: Outer;

    init() {
        self.data = Outer{
            foo: 7,
            nest: Inner{
                y: 5,
                rest: emptyCell().asSlice(),
            },
        };
    }
}