struct StructWithDefaultOptionals {
    foo: Int? = null;
    bar: Bool? = null;
    baz: Address? = null;
    str: String = "default";
}

contract StructDefaults {
    st: StructWithDefaultOptionals;

    init() {
        self.st = StructWithDefaultOptionals{};
    }
}