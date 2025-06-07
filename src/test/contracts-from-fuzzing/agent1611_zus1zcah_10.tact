struct MixNestedDefaults {
    id: Int;
    nested: Nested;
}

struct Nested {
    x: Int = 5;
    y: Bool = false;
    s: String? = null;
}

contract MixNestTest {
    data: MixNestedDefaults;
    init() {
        self.data = MixNestedDefaults{
            id: 7,
            nested: Nested{}
        };
    }
}