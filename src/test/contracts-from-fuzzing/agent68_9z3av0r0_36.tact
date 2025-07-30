struct MultipleDefaultOptional {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract MultipleDefOptContract {
    storage: MultipleDefaultOptional;

    init() {
        self.storage = MultipleDefaultOptional{};
    }
}