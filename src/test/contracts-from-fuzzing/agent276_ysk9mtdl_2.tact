struct InnerStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract NestedStructTest {
    point: InnerStruct;

    init() {
        self.point = InnerStruct{
            x: 1,
            y: false,
            z: "hi"
        };
    }
}
