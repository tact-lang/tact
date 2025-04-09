struct OptionalWithDefault {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: String? = null;
    e: Cell? = null;
    f: Slice? = null;
}

contract OptWithDefaultStruct {
    val: OptionalWithDefault;

    init() {
        self.val = OptionalWithDefault{};
    }
}