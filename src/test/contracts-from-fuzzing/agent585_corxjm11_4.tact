struct MultiOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
}

contract OptionalsInField {
    data: MultiOptionals;

    init() {
        self.data = MultiOptionals{
            opt1: null,
            opt2: true,
            opt3: null,
        };
    }
}