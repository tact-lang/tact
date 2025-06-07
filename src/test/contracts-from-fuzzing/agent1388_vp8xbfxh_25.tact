struct S { foo: Int; }

contract Test {
    val: S?;

    init() {
        self.val = S{ foo: 123 };
    }
}
