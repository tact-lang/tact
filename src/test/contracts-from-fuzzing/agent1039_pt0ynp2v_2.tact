struct OptionalStruct {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    state: OptionalStruct;

    init() {
        self.state = OptionalStruct{ x: null, y: true };
    }
}