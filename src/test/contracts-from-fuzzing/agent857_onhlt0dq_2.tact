struct Nested {
    score: Int;
    label: String;
    active: Bool;
}

contract Test {
    nested: Nested;
    id: Int;
    desc: String;

    init() {
        self.nested = Nested{ score: 5, label: "foo", active: false };
        self.id = 1;
        self.desc = "bar";
    }
}