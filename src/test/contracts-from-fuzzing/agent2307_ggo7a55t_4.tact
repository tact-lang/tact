struct ContainStrings {
    long: String;
    mid: String?;
    tiny: String;
}

contract StrContract {
    store: ContainStrings;

    init() {
        self.store = ContainStrings{
            long: "a long string with some data inside",
            mid: null,
            tiny: "x"
        };
    }
}
