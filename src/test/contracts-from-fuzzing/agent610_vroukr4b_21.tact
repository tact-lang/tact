struct WithOptional {
    a: Int?
}

contract Top {
    wa: WithOptional;

    init() {
        self.wa = WithOptional{a: null};
    }
}