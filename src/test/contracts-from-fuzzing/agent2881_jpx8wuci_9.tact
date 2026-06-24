struct OptionalCombination {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptionalsInContract {
    o: OptionalCombination;

    init() {
        self.o = OptionalCombination{
            optInt: null,
            optBool: false,
            optString: "present"
        };
    }
}