struct OptionWithNested {
    a: Int;
    b: String?;
}

contract StorageOptionNested {
    s: OptionWithNested?;

    init() {
        self.s = OptionWithNested{a:1, b:null};
    }
}