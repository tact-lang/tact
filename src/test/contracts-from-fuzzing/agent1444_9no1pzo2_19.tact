struct Annotated {
    x: Int as int64;
    y: Int as uint8;
    z: Int;
}

contract SerializedFields {
    point: Annotated;

    init() {
        self.point = Annotated{
            x: -42,
            y: 255,
            z: 10,
        };
    }
}
