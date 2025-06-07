struct S {
    val: Int;
}

contract OptStructFieldTest {
    s: S?;

    init() {
        self.s = null;
    }
}