struct DefaultMixed {
    a: Int = 5;
    b: Bool;
    c: Int? = null;
}

contract DefMixedTest {
    val: DefaultMixed;

    init() {
        self.val = DefaultMixed{ b:true };
    }
}
