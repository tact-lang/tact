struct StructWithTrailingComma {
    a: Int;
    b: Bool;
}

contract TrailingCommaTest {
    val: StructWithTrailingComma;
    init() {
        self.val = StructWithTrailingComma{
            a: 5,
            b: false,
        };
    }
}