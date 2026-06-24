struct OptionalStruct {
    x: Int = 100;
    y: Bool?;
    z: Inner?;
}

struct Inner {
    value: Int;
}

contract OptStructTest {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            y: null,
            z: null,
        };
    }
}