struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{ x: null, y: null, z: "hi" };
    }
}