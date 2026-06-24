struct MultipleOptionals {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract Opts {
    data: MultipleOptionals;

    init() {
        self.data = MultipleOptionals{ optInt: null, optBool: null, optStr: null };
    }
}