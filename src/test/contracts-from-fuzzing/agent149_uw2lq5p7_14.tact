struct BoolIntString {
    x: Bool;
    y: Int;
    z: String;
}

contract MixedFields {
    data: BoolIntString;

    init() {
        self.data = BoolIntString{
            x: false,
            y: 55,
            z: "test"
        };
    }
}