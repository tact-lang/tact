struct Tail {
    d: Int;
}

struct Head {
    a: Int;
    b: Bool;
    c: Tail;
}

contract NestedOrdering {
    data: Head;

    init() {
        self.data = Head{
            a: 1,
            b: false,
            c: Tail { d: 999 }
        };
    }
}