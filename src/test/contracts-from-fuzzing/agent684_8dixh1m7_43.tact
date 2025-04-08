struct ComplexDefault {
    a: Int = 1;
    b: Bool = true;
    s: String = "hello";
    optVal: Int?;
}

contract ComplexDefaultTest {
    val: ComplexDefault;
    init() {
        self.val = ComplexDefault {
            optVal: null
        };
    }
}