struct Inner {
    x: Int;
    y: String;
    flag: Bool;
}

struct Outer {
    nested: Inner;
    number: Int;
    text: String;
    option: Int?;
}

contract ComplexPersist {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Inner{
                x: 10,
                y: "abc",
                flag: false,
            },
            number: 42,
            text: "hello",
            option: null,
        };
    }
}
