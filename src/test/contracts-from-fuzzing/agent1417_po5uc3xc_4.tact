struct Wrapped {
    value: Int?;
}

struct DoubleOptional {
    outer: Wrapped?;
}

contract OptionalTest {
    state: DoubleOptional;
    init() {
        self.state = DoubleOptional{
            outer: Wrapped{ value: null }
        };
    }
}