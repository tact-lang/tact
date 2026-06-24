struct Tail {
    foo: Int;
    data: Slice as remaining;
}

contract TestContract {
    tail: Tail;

    init() {
        self.tail = Tail{
            foo: 42,
            data: emptyCell().asSlice()
        };
    }

    receive() {
        let _ = self.tail.foo;
    }
}