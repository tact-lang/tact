// Optional struct with optional fields
struct OptionalDeepFields {
    foo: Int?;
    bar: String?;
}

contract TestContract {
    deepest: OptionalDeepFields?;

    init() {
        self.deepest = OptionalDeepFields{ foo: null, bar: null };
    }
}
