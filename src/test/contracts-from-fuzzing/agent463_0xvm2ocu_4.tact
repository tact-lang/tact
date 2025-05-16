struct OptionalDeepNested {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct OptionalWrapper {
    nested: OptionalDeepNested?;
}

contract OptionalDeepTest {
    item: OptionalWrapper;
    init() {
        self.item = OptionalWrapper{
            nested: null
        };
    }
}
