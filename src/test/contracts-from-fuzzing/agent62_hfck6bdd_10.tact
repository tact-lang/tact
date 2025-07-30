struct OptionalNested {
    foo: Int?;
    bar: Bool?;
}

struct HoldsOptionalNested {
    inner: OptionalNested?;
}

contract OptionalOfStructTest {
    fld: HoldsOptionalNested;

    init() {
        self.fld = HoldsOptionalNested { inner: null };
    }
}