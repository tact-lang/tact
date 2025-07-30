struct PossiblyEmpty {
    text: String?;
    number: Int?;
}

contract Test {
    s: PossiblyEmpty? = null;

    init() {
        self.s = PossiblyEmpty{
            text: "hi",
            number: null
        };
    }
    receive() {}
}