struct OptionalsGroup {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract AllOptional {
    data: OptionalsGroup;

    init() {
        self.data = OptionalsGroup{one:null, two:null, three:null};
    }
}