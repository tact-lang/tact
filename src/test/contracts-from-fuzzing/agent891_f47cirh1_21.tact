struct OptionalNestedDeep {
    inner1: Int?;
    inner2: String?;
    inner3: Bool?;
}

struct OptionalLayer2 {
    nested: OptionalNestedDeep?;
}

contract OptDeepInDeepTest {
    data: OptionalLayer2;

    init() {
        self.data = OptionalLayer2{
            nested: null
        };
    }
}
