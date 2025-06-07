struct FieldsTest {
    a: Int;
    b: Bool;
    c: String;
}

contract FieldInit {
    s: FieldsTest;

    init() {
        self.s = FieldsTest{ a:1, b:true, c:"hi" };
    }
}
