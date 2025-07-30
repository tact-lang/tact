// contract with an optional struct, inside of which optional string
struct InnerOpt {
    text: String?;
}
contract NestedOptString {
    inner: InnerOpt?;
    init() {
        self.inner = null;
    }
}