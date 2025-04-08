// contract with persistent optional struct which itself contains another optional
struct InnerOpt {
    a: Int?;
    b: Int;
}

contract OptOfStructWithOpt {
    field: InnerOpt?;

    init() {
        self.field = null;
    }
}