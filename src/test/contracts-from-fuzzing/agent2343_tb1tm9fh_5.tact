struct NestedOptional {
    inner1: Int?;
    inner2: Bool?;
}

contract OptionalStructTest {
    opt: NestedOptional?;

    init() {
        self.opt = null;
    }
}
