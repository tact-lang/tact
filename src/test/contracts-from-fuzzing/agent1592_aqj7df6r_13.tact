struct MultiDefaults {
    a: Int = 10;
    b: Bool = false;
    c: Slice;
    d: Int?;
}

contract DefaultsTest {
    s: MultiDefaults;

    init() {
        self.s = MultiDefaults{
            c: emptyCell().asSlice(),
            d: null,
        };
    }
}