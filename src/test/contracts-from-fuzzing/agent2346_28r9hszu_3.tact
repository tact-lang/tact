struct ComplexOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
    addr: Address?;
}

contract OptionalStructTest {
    data: ComplexOptionals;

    init() {
        self.data = ComplexOptionals{
            x: 5,
            y: null,
            z: "foo",
            addr: null
        };
    }
}