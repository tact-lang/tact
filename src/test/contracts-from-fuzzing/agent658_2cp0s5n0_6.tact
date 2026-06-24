struct NestedOpt {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Address?;
}

contract OptContract {
    store: NestedOpt;

    init() {
        self.store = NestedOpt{
            f1: null,
            f2: null,
            f3: null,
            f4: null
        };
    }
}