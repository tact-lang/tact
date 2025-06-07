struct Nested {
    num: Int;
    flag: Bool;
    text: String;
}

struct Outer {
    nested: Nested;
    anotherNum: Int;
}

contract DeepContract {
    complexField: Outer = Outer{
        nested: Nested{num: 1, flag: true, text: "hi"},
        anotherNum: 2
    };

    init() {
        self.complexField = Outer{
            nested: Nested{num: 42, flag: false, text: "hello"},
            anotherNum: 7
        };
    }
}
