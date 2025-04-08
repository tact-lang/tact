struct NestedStructWithLongDefaults {
    s: String = "long default string literal to check blah blah";
}

contract LongStringDefaultNested {
    nest: NestedStructWithLongDefaults;

    init() {
        self.nest = NestedStructWithLongDefaults{};
    }
}