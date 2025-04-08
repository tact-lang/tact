struct InnerD {
    foo: Int = 999;
    bar: Bool = false;
}

struct OuterD {
    inner: InnerD;
    num: Int;
}

contract NestedDefaults {
    data: OuterD;

    init() {
        self.data = OuterD{
            inner: InnerD{},
            num: 12345
        };
    }
}