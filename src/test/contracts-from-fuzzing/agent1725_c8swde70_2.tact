struct Nested1 {
    a: Int;
    b: Bool;
    c: String?;
}

struct Nested2 {
    first: Nested1;
    second: Nested1;
    flag: Bool;
}

contract TestNested {
    record: Nested2;

    init() {
        self.record = Nested2{
            first: Nested1{ a: 1, b: true, c: null },
            second: Nested1{ a: 2, b: false, c: "hi" },
            flag: true
        };
    }
}