struct NestedOptionalIntBool {
    inner: OptionalIntBool;
}

struct OptionalIntBool {
    a: Int?;
    b: Bool?;
}

contract TestNestedOptionalIntBool {
    d: NestedOptionalIntBool;

    init() {
        self.d = NestedOptionalIntBool{
            inner: OptionalIntBool{
                a:null,
                b:null
            }
        };
    }
}