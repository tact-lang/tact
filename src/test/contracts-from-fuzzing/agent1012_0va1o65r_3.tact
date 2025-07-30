struct OptionalStruct {
    x: Int;
    y: Int?;
}

contract OptStructTest {
    data: OptionalStruct?;

    init() {
        self.data = OptionalStruct{ x: 10, y: null };
    }
}