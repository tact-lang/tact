struct WithOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract Test {
    data: WithOptionals;
    init() {
        self.data = WithOptionals {
            f1: null, f2: false, f3: "hi"
        };
    }
}