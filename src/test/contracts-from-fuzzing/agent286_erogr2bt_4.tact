struct OptionalNest {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    num: Int?;
}

contract Test {
    st: OptionalNest;

    init() {
        self.st = OptionalNest{
            inner: Inner{
                flag: true,
                num: null
            }
        };
    }
}
