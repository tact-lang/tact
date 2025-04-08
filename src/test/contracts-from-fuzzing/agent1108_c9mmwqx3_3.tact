struct NestedData {
    x: Int;
    y: Bool;
    z: String?;
}

contract TestContract {
    data: NestedData;

    init() {
        self.data = NestedData{
            x: 7,
            y: false,
            z: "hello"
        };
    }
}