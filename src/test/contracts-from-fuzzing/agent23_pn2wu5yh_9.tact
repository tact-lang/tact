struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    x: Cell;
}

contract GetterNested {
    receive() {}

    // Getter that returns a nested composite structure
    get fun getNested(): Outer {
        return Outer{
            inner: Inner{
                a: 10,
                b: true
            },
            x: beginCell().endCell()
        };
    }
}
