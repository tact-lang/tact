struct ManyNestedOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    inner: Inner?;
}

struct Inner {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract NestedOptionalStorage {
    param: ManyNestedOptionals;

    init() {
        self.param = ManyNestedOptionals{
            i: null,
            b: null,
            s: null,
            inner: null,
        };
    }
}