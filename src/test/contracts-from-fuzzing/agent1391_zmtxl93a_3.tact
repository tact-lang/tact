struct S1 {
    a: Int?;
    b: Bool?;
}

contract OptionalStructTest {
    field1: S1?;

    init() {
        self.field1 = null;
    }
}