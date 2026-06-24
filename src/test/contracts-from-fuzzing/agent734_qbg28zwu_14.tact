struct Nested {
    val: Int;
    opt: Bool?;
}

struct ContainsNested {
    n1: Nested;
    n2: Nested;
    extra: String;
    f: Bool;
}

contract TestContract {
    s: ContainsNested;

    init() {
        self.s = ContainsNested{
            n1: Nested{ val: 10, opt: null },
            n2: Nested{ val: 20, opt: true },
            extra: "bar",
            f: false
        };
    }
}