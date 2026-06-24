struct OptionalTwo {
    a: Int? = 10;
    b: String? = null;
}

struct WrapOptTwo {
    inner: OptionalTwo?;
    msg: String;
}

contract PartiallyInitNestedOpt {
    val: WrapOptTwo;

    init() {
        self.val = WrapOptTwo{
            inner: OptionalTwo{ a: null }, // set one, rely on default for b
            msg: "partial"
        };
    }
}