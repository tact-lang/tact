struct OptsInOpts {
    a: Int?;
    b: Bool?;
    c: InnerOpt2?;
}

struct InnerOpt2 {
    d: String?;
}

contract OptionalStructField {
    val: OptsInOpts?;

    init() {
        self.val = null;
    }
}