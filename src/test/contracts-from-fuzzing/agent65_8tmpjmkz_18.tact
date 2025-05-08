struct AllOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract AllOptionals {
    data: AllOpt;

    init() {
        self.data = AllOpt{a: null, b: null, c: null};
    }
}