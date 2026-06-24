struct OpStruct {
    a: Int?;
    s: String?;
    b: Bool?;
}

contract Test {
    state: OpStruct?;

    init() {
        self.state = null;
    }
}
