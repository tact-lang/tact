struct Inner {
    x: Int;
    tail: Slice as remaining;
}

struct Outer {
    some: Int;
    nested: Inner;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            some: 42,
            nested: Inner{
                x:1,
                tail: "tail".asComment().asSlice(),
            },
        };
    }
}