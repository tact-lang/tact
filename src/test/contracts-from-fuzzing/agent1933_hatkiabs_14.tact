struct NestedOptionals {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

struct Wrapper {
    nested: NestedOptionals;
}

contract OptionalNestedTest {
    field: Wrapper;
    init() {
        self.field = Wrapper{
            nested: NestedOptionals{
                optInt: null,
                optBool: null,
                optString: null,
            }
        };
    }
}