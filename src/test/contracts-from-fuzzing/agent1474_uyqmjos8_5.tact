struct OptNested {
    field1: Int?;
    field2: Bool?;
    field3: String?;
}

contract Test5 {
    st: OptNested;
    init() {
        self.st = OptNested{ field1: null, field2: true, field3: null };
    }
}