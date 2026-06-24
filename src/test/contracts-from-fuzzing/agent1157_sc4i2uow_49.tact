struct NestedMixed {
    a: Int;
    b: Bool?;
    c: String;
}

contract NestedMixedContract {
    x: NestedMixed;

    init() {
        self.x = NestedMixed{ a: 1, b: null, c: "ok" };
    }
}