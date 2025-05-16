struct Tail {
    a: Int;
    b: String;
}

struct Head {
    pre: Bool;
    nested: Tail;
    optNested: Tail?;
}

contract TestContract {
    data: Head;

    init() {
        self.data = Head{
            pre: true,
            nested: Tail{ a:1, b:"A" },
            optNested: null
        };
    }
}