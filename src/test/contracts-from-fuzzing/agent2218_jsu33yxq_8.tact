struct Outer {
    nested: Inner;
    flag: Bool;
}

struct Inner {
    text: String;
    number: Int;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Inner{
                text: "hi",
                number: 123
            },
            flag: false
        };
    }
}