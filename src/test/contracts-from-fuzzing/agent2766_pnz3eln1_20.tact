struct OptionalStrings {
    name: String?;
    info: String?;
}

contract OptStringContract {
    val: OptionalStrings;

    init() {
        self.val = OptionalStrings{
            name: null,
            info: null,
        };
    }
}