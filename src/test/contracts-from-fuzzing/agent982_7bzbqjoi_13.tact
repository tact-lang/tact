struct SimpleStruct {
    a: Int;
    b: Bool;
}

struct DoubleNested {
    inner: SimpleStruct;
    flag: Bool;
}

struct TopStruct {
    nested: DoubleNested;
    string: String;
}

contract MultiNestedContract {
    storage: TopStruct;

    init() {
        self.storage = TopStruct{
            nested: DoubleNested{
                inner: SimpleStruct{a: 5, b: true},
                flag: false
            },
            string: "abc"
        };
    }
}