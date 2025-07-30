struct Inner {
    s: String;
    flag: Bool?;
}

struct Outer {
    number: Int;
    nested: Inner;
}

contract Test {
    storage: Outer;

    init() {
        self.storage = Outer{
            number: 123,
            nested: Inner{
                s: "xyz",
                flag: null,
            },
        };
    }
}