struct ZeroFields {
    a: Int = 0;
    b: Int = 0;
    c: Int = 0;
}

contract DefaultedStructTest {
    data: ZeroFields;

    init() {
        self.data = ZeroFields{};
    }
}
