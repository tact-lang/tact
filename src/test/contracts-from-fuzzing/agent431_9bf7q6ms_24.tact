struct SingleOptional {
    a: Int?;
}

contract OnlyOneOptField {
    s: SingleOptional;

    init() {
        self.s = SingleOptional{ a: null };
    }
}
