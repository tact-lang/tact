struct OptionalStruct {
    a: Int;
    b: Bool?;
    c: String?;
}

contract OptionalStructTest {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}