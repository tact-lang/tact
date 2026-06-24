struct OptionalStruct {
    x: Int?;
    y: Int?;
}

contract TestContract {
    field: OptionalStruct?;

    init() {
        self.field = OptionalStruct{x: 100, y: 200};
    }
}