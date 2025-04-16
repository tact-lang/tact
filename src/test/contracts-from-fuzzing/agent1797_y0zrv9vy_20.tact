struct BoolSerializeTest {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract Test {
    bst: BoolSerializeTest;
    init() {
        self.bst = BoolSerializeTest{ a: true, b: false, c: true };
    }
}