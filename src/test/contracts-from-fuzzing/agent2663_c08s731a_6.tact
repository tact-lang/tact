struct OptionalNest {
    inner: Inner?;
}

struct Inner {
    str: String;
    num: Int;
}

contract OptNestStorage {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            inner: null
        };
    }
}