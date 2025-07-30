// optional deeply nested inside fields with defaults
struct SSS {
    a: Int? = null;
    b: Bool = false;
}

contract DefOpt {
    val: SSS;
    init() {
        self.val = SSS{};
    }
}