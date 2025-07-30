struct S { foo: Int; }

contract Test {
    val: S?;

    init() {
        self.val = null;
    }
}
