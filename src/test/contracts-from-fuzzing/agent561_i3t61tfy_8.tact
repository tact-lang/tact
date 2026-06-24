struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

struct OuterOpt {
    x: Int;
    inner: InnerOpt;
    txt: String?;
}

contract NestedOptionalStorage {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            x: 1,
            inner: InnerOpt{foo: null, bar: null},
            txt: null
        };
    }
}