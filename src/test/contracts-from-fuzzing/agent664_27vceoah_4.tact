struct OptionalDeep {
    s: String?;
    b: Bool?;
    i: Int?;
}

struct Container {
    nested: OptionalDeep?;
}

contract OptDeepTest {
    data: Container;

    init() {
        self.data = Container{ nested: null };
    }
}
