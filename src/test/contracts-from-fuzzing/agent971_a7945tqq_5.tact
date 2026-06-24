struct OptNest {
    val: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    message: String?;
}

contract OptNested {
    complexOpt: OptNest;

    init() {
        self.complexOpt = OptNest{
            val: null,
            inner: null
        };
    }
}