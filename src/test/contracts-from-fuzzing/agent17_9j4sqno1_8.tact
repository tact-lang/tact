struct OptionalBoolString {
    flag: Bool?;
    note: String?;
}

contract OptMix {
    st: OptionalBoolString;

    init() {
        self.st = OptionalBoolString{
            flag: true,
            note: "hello"
        };
    }
}