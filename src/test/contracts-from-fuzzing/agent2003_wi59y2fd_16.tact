struct S { a: Int; b: Int; c: Bool; d: String; }

contract Test {
    item1: S;
    item2: S;

    init() {
        self.item1 = S{ a: 1, b: 2, c: true, d: "x" };
        self.item2 = S{ a: 3, b: 4, c: false, d: "y" };
    }
}
