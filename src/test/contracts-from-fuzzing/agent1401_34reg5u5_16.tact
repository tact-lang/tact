struct WithString {
    s: String;
    i: Int;
}

struct WithOptionalString {
    s: String?;
    i: Int;
}

contract StructsWithStrings {
    a: WithString;
    b: WithOptionalString;

    init() {
        self.a = WithString{ s: "hello", i:1 };
        self.b = WithOptionalString{ s: null, i:2 };
    }
}