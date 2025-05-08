struct DeepNested {
    inner: Nested;
    flag: Bool;
}

struct Nested {
    num: Int;
    text: String;
}

contract TestContract {
    s: DeepNested;

    init() {
        self.s = DeepNested{
            inner: Nested{ num: 5, text: "hello" },
            flag: true
        };
    }
}