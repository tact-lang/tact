struct StructWithOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptionalCompositeTest {
    s: StructWithOptionals?;
    init() {
        self.s = null;
    }
}