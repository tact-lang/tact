struct InnerOption {
    v: Int?;
}

contract OptionalsSerialize {
    one: InnerOption?;

    init() {
        self.one = InnerOption{ v:null };
    }
}