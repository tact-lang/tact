struct OptionGroup {
    s: String?;
    b: Bool?;
    n: Int?;
    a: Address?;
}

contract OptGroupField {
    group: OptionGroup;

    init() {
        self.group = OptionGroup{
            s: null,
            b: true,
            n: 5,
            a: null
        };
    }
}