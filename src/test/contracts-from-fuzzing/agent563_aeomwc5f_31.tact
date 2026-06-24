struct Tail {
    d: Slice as remaining;
}

struct Container {
    a: Int;
    b: Tail;
}

contract HasRemainingField {
    data: Container;

    init() {
        self.data = Container{
            a: 1,
            b: Tail{ d: emptyCell().asSlice() }
        };
    }
}