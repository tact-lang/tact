struct MultipleOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
    o5: Cell?;
}

contract OptionalsContract {
    optFields: MultipleOptionals;

    init() {
        self.optFields = MultipleOptionals{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null,
        };
    }
}
