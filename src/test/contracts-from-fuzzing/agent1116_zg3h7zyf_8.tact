struct Inner {
    foo: Int;
}

struct Outer {
    optInt: Int?;
    optInner: Inner?;
    optBool: Bool?;
    optStr: String?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            optInt: null,
            optInner: null,
            optBool: null,
            optStr: null
        };
    }
}