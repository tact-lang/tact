struct NestedOptionals {
    inner: Wrapper?;
}

struct Wrapper {
    optInt: Int?;
    optBool: Bool?;
}

contract NestedOptionalFields {
    storage: NestedOptionals;
    init() {
        self.storage = NestedOptionals{
            inner: Wrapper{
                optInt: 42,
                optBool: false
            }
        };
    }
}