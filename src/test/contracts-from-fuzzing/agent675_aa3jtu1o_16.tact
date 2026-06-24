struct OptStruct {
    foo: Int?;
    bar: Bool?;
    text: String?;
}

contract OptionalInsideStructTest {
    s: OptStruct = OptStruct{};

    receive() {
        let _ = self.s.bar;
    }
}