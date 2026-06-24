struct DefaultOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract WithDefaultsInStruct {
    val: DefaultOptionals;

    init() {
        self.val = DefaultOptionals{};
    }
}
