// Contract with optional nested struct and some defaults
struct NestedDefOpt {
    val: Int = 5;
    desc: String?;
}

contract OptionalNestedDefault {
    s: NestedDefOpt?;

    init() {
        self.s = null;
    }
}
