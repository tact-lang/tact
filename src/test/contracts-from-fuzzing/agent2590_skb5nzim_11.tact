struct DeepBool {
    inner: InnerOptionalBool?;
}

struct InnerOptionalBool {
    val: Bool?;
}

contract DeepOptionBoolContract {
    foo: DeepBool;
    init() {
        self.foo = DeepBool{
            inner: null
        };
    }
}