struct OneLevel {
    a: Int;
    b: Bool;
    c: String;
}

struct TopLevel {
    nested: OneLevel;
    flag: Bool;
    value: Int;
}

contract NestedStructs {
    s: TopLevel;

    init() {
        self.s = TopLevel{
            nested: OneLevel{ a: 99, b: false, c: "abc" },
            flag: true,
            value: 42
        };
    }
}