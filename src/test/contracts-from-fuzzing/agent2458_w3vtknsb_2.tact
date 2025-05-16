struct NestedOptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            x: null,
            y: true,
            z: "text"
        };
    }
}