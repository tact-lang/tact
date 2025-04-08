struct Nested {
    num: Int?;
    txt: String?;
}

contract WithStructOpt {
    nested: Nested?;

    init() {
        self.nested = Nested{num:5, txt:"hi"};
    }
}