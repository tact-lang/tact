struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract OptStructTest {
    s: NestedOpt;
    init() {
        self.s = NestedOpt{ a: null, b: true };
    }
}