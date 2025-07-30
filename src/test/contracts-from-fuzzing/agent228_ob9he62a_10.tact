struct CorrectRemaining {
    a: Int;
    tail: Slice as remaining;
}

struct Container {
    foo: Bool;
    rem: CorrectRemaining;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            foo: true,
            rem: CorrectRemaining{
                a: 42,
                tail: emptyCell().asSlice()
            }
        };
    }
}