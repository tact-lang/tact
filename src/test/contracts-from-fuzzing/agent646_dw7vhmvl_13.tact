struct BoolPrimitiveField {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract ManyBoolsTest {
    data: BoolPrimitiveField;

    init() {
        self.data = BoolPrimitiveField{
            a: true,
            b: false,
            c: true,
            d: false
        };
    }
}