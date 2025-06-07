struct Nested {
    inner1: Int;
    inner2: Bool;
}

struct Outer {
    nested: Nested;
    flag: Bool;
    text: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ nested: Nested{ inner1: 42, inner2: false }, flag: true, text: "ok" };
    }
}