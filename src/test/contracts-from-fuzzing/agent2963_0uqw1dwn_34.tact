struct HasTwo {
    a: Int;
    b: String?;
}

contract OptionalsNestedDeeper {
    sopt: HasTwo?;
    iopt: Int?;
    bopt: Bool?;
    sopt2: String?;

    init() {
        self.sopt = HasTwo{
            a: 11,
            b: null
        };
        self.iopt = 1;
        self.bopt = false;
        self.sopt2 = "abc";
    }
}
