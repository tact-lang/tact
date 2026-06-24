struct OptionalString {
    val: String?;
}

contract TestContract {
    s: OptionalString;

    init() {
        self.s = OptionalString{val: null};
    }
}