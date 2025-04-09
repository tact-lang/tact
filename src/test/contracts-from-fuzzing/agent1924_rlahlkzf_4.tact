struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            x: null,
            y: true,
            z: "test"
        };
    }
}