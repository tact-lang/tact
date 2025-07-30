struct Inner {
    flag: Bool?;
    num: Int?;
    word: String?;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{
            flag: null,
            num: null,
            word: null,
        };
    }
}