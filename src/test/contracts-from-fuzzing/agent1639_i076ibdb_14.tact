struct Tail {
    x: Int;
    tail: Slice as remaining;
}

struct Container {
    n: Int;
    t: Tail;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            n: 123,
            t: Tail{
                x: 7,
                tail: "data here".asComment().asSlice()
            }
        };
    }
}