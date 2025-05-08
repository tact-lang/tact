struct InnerNested {
    flag: Bool;
    comment: String;
}

struct Inner {
    number: Int;
    nested: InnerNested;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner {
            number: 77,
            nested: InnerNested {
                flag: true,
                comment: "nest"
            }
        };
    }
}
