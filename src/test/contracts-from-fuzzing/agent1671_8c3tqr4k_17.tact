struct Tail {
    bits: Slice as remaining;
}

struct Container {
    prefix: Int;
    suffix: Tail;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            prefix: 123,
            suffix: Tail{
                bits: emptyCell().asSlice()
            }
        };
    }
}