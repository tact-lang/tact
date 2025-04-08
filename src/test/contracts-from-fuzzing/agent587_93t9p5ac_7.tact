struct OptionalBoolInt {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract OptionalBoolIntTest {
    field: OptionalBoolInt;

    init() {
        self.field = OptionalBoolInt{
            a:null, b:null, c:null, d:null
        };
    }
}