struct DefaultsOptionalInner {
    foo: Int? = null;
    bar: Bool? = null;
}

contract NestedDefaultsOptional {
    data: DefaultsOptionalInner;

    init() {
        self.data = DefaultsOptionalInner{};
    }
}