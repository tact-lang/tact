struct IntAndOptional {
    a: Int;
    b: Int?;
}

contract IntAndOptionalContract {
    x: IntAndOptional;

    init() {
        self.x = IntAndOptional { a: 42, b: null };
    }
}