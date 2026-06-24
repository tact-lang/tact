// Optional string in nested struct inside contract
struct Inner {
    s: String?;
}

contract NestedOptionalString {
    i: Inner;

    init() {
        self.i = Inner{ s: null };
    }
}