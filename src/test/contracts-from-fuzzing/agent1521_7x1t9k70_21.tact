struct DeepOpt {
    flag: Bool?;
    note: String?;
}

contract NestedOptStructField {
    data: DeepOpt?;

    init() {
        self.data = null;
    }
}