struct Data {
    x: Int;
}

contract OptionalAssignedSome {
    optData: Data?;

    init() {
        self.optData = Data{ x: 100 };
    }
}