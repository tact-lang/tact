// optional of optional (should reject nested optionals)
// but nested optional inside struct optional is allowed

struct InnerOpt {
    value: Int?;
}

contract TestContract {
    s: InnerOpt?;

    init() {
        self.s = null;
    }
}