struct OptionalWrap {
    foo: Int?;
    bar: String?;
}

contract ContainsOptWrap {
    val: OptionalWrap;
    init() {
        self.val = OptionalWrap{ foo: null, bar: null };
    }
}