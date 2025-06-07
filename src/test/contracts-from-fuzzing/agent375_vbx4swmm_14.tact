struct Deep {
    s: Slice;
    c: Cell;
    a: Address;
}

struct Mid {
    d: Deep;
}

struct Root {
    m: Mid;
}

contract TestContract {
    data: Root;

    init() {
        self.data = Root{
            m: Mid{
                d: Deep{
                    s: emptyCell().asSlice(),
                    c: emptyCell(),
                    a: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
                },
            },
        };
    }

    receive() {
        let _ = self.data;
    }
}