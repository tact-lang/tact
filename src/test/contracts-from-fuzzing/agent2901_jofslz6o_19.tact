struct OptionalStruct {
    x: Int?;
    y: Bool?;
}

contract Test {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}