struct OptionalStructTest {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract StructFieldOptional {
    state: OptionalStructTest;
    init() {
        self.state = OptionalStructTest{ a: null, b: null, c: null };
    }
    receive() {}
}