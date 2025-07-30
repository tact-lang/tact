struct MultipleOptionals {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract MultipleOptionalsStorage {
    optFields: MultipleOptionals;

    init() {
        self.optFields = MultipleOptionals{
            one: null,
            two: null,
            three: null,
        };
    }
}