struct NestedOpt {
    a: Int?; b: Bool?; c: String?;
}

contract NestedOptionalTest {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{ a: null, b: null, c: null };
    }
}
