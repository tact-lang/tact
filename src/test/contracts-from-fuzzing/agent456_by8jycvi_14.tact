struct IntStringBool {
    x: Int;
    y: String;
    z: Bool;
}

contract IntStringBoolContract {
    data: IntStringBool;

    init() {
        self.data = IntStringBool {
            x: 100,
            y: "world",
            z: false
        };
    }
}