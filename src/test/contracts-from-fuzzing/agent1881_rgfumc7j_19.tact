struct OptionalBoolInt {
    b: Bool?;
    i: Int?;
}

contract OptBoolIntTest {
    x: OptionalBoolInt;

    init() {
        self.x = OptionalBoolInt{ b: null, i: null };
    }
}