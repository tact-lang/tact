struct OptionalDefaulted {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract OptDefaultsContract {
    data: OptionalDefaulted;

    init() {
        self.data = OptionalDefaulted {};
    }
}