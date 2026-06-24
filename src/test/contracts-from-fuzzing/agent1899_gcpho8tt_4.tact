struct OptionalNest {
    inner: InnerOpt?;
    flag: Bool;
}

struct InnerOpt {
    val: Int;
    txt: String?;
}

contract OptionalNestContract {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            inner: null,
            flag: false
        };
    }
}