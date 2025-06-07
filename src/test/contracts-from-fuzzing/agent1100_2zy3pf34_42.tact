struct OptionOptional {
    o: Int?;
}

struct Wrap {
    w: OptionOptional?;
}

contract DoubleNullableTest {
    field: Wrap;

    init() {
        self.field = Wrap{
            w: null
        };
    }
}
