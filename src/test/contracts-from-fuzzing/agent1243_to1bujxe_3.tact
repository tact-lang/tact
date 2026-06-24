struct Nested2 {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
}

contract Test {
    f: Nested2;
    init() {
        self.f = Nested2{ a: 1, b: false, c: "abc", d: myAddress(), e: null };
    }
}