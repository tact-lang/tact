struct NestedOpt {
    val: Int?;
    txt: String?;
}

contract OptStructTest {
    nested: NestedOpt?;
    init() {
        self.nested = null;
    }
}