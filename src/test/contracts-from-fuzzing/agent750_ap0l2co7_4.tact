struct STest {
    a: Int;
    b: Int?;
}

contract OptionalStructField {
    s: STest;
    init() {
        self.s = STest{a: 1, b: null};
    }
}