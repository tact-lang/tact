struct StructWithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}
contract DefaultNullTest {
    s: StructWithOptionals;

    init() {
        self.s = StructWithOptionals{};
    }
}