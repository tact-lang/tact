// test optional nested struct field containing optionals
struct OptionalsInside {
    a: Int?;
    b: Bool?;
}

contract OptNestedStructOptionals {
    f: OptionalsInside?;

    init() {
        self.f = null;
    }
}
