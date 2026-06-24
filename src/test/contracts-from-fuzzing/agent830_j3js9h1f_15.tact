struct LeadingOptional {
    maybe: Int?;
    f1: Int;
    f2: String;
}

contract TestLeadingOptional {
    data: LeadingOptional;

    init() {
        self.data = LeadingOptional{
            maybe: null,
            f1: 2,
            f2: "hello"
        };
    }
}