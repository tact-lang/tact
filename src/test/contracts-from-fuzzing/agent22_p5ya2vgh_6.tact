struct AllOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract AllOptPersist {
    state: AllOptionals;

    init() {
        self.state = AllOptionals{
            a: null,
            b: null,
            c: null
        };
    }
}
