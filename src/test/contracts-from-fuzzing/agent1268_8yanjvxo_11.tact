struct OptsDefaults {
    a: Int?;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    s: OptsDefaults;

    init() {
        self.s = OptsDefaults{
            a: null
        };
    }
}