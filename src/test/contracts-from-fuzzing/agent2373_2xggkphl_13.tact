struct OptionalAndDefault {
    a: Int?;
    b: Int = 3;
}

contract OptionDefaultMix {
    data: OptionalAndDefault;

    init() {
        self.data = OptionalAndDefault{ a: null };
    }
}