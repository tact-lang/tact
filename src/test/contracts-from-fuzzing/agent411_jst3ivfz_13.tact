struct SubS {
    v1: Int;
    v2: Int?;
}

contract OptionalStructFieldTest {
    s: SubS?;

    init() {
        self.s = null;
    }
}