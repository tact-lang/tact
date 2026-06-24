struct OptionStruct {
    maybe: InnerStruct?;
}

struct InnerStruct {
    x: Int?;
    y: Bool?;
}

contract NullableStructTest {
    s: OptionStruct?;

    init() {
        self.s = null;
    }
}