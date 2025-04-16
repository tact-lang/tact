// Persistent field is an optional struct with optional nested
struct InnerN {
    a: Int?;
}

contract DoubleOptWrap {
    val: InnerN?;

    init() {
        self.val = null;
    }
}