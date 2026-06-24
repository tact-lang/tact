struct Nested1 {
    a: Int;
    b: Bool;
    c: String;
}

struct Holder {
    x: Int;
    nested: Nested1;
}

contract Test {
    data: Holder;

    init() {
        self.data = Holder{
            x: 1,
            nested: Nested1{
                a: 2,
                b: false,
                c: "hi",
            },
        };
    }

    receive() {}
}