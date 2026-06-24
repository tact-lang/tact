struct NestedOpts {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract NestedOptsTest {
    a: NestedOpts?;

    init() {
        self.a = null;
    }
}