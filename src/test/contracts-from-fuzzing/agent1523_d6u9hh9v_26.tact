// Persistent state with optional struct type
struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptionalHolder {
    val: InnerOpt?;

    init() {
        self.val = null;
    }
}