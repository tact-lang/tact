struct OuterOption {
    inner: Int?;
}

contract OptionalStructInline {
    s: OuterOption;
    init() {
        self.s = OuterOption{ inner:null };
        self.s = OuterOption{ inner:5 };
    }
}