struct OptionalChain4 { foo: Int?; bar: Bool?; baz: String?; }
struct OptionalChain3 { inner: OptionalChain4?; }
struct OptionalChain2 { inner: OptionalChain3?; }
struct OptionalChain1 { inner: OptionalChain2?; }

contract NestedNulls {
    f: OptionalChain1?;
    init() {
        self.f = null;
    }
}