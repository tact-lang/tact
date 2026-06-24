// optional of struct with optional int
struct OptStruct {
    foo: Int?;
}

contract OptionalOfOptionalStruct {
    inner: OptStruct? = null;

    init() {
        self.inner = OptStruct{foo:7};
    }
}