struct StructA {
    s: String;
}

struct StructB {
    a: StructA;
    s2: String;
}

contract LotsOfStrings {
    s: StructB;

    init() {
        self.s = StructB{ a: StructA{s:"hi"}, s2: "hello" };
    }
}
