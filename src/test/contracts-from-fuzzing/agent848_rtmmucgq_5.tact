struct OptNested {
    foo: Int?;
    bar: Bool?;
}

contract StructWithOptionalNested {
    data: OptNested?;

    init() {
        self.data = OptNested{
            foo: 123,
            bar: true
        };
    }
}