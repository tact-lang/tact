struct OptionalDefault {
    a: Int? = null;
    b: Bool? = false;
}

contract OptDefMix {
    val: OptionalDefault;

    init() {
        self.val = OptionalDefault{ a: null, b: true };
    }
}