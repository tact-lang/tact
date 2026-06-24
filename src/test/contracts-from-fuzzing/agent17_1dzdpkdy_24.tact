struct Sub {
    tail: Slice as remaining;
}

struct Container {
    a: Int;
    s: Sub;
    other: Cell as remaining;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            a: 1,
            s: Sub{ tail: emptyCell().asSlice() },
            other: emptyCell(),
        };
    }
}