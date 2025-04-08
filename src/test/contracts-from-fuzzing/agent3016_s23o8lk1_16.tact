struct OptionalString {
    a: String?;
    b: String?;
}

contract TestContract {
    optStr: OptionalString;

    init() {
        self.optStr = OptionalString{
            a: null,
            b: "hey"
        };
    }
}