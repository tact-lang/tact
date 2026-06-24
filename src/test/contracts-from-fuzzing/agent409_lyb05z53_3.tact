struct OptionalNested {
    x: Int?;
    y: Bool?;
    z: Address?;
}

struct StructWithOptionals {
    nestedOpt: OptionalNested?;
    extra: Int;
}

contract OptionalTest {
    data: StructWithOptionals;

    init() {
        self.data = StructWithOptionals{
            nestedOpt: null,
            extra: 7,
        };
    }
}