struct Deep {
    nested: Inner;
}

struct Inner {
    flag: Bool;
    data: InnerMost;
}

struct InnerMost {
    value: Int;
    name: String;
}

contract Test {
    info: Deep;

    init() {
        self.info = Deep{
            nested: Inner{
                flag: false,
                data: InnerMost{ value: 10, name: "foo" }
            }
        };
    }
}