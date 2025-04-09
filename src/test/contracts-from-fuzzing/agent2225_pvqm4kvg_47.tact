struct WithStrings {
    a: String;
    b: String?;
}

contract StructOptStrings {
    data: WithStrings;

    init() {
        self.data = WithStrings{ a: "hi", b: null };
    }
}