struct Inner {
    foo: Int;
}

struct Outer {
    innerOpt: Inner?;
    countOpt: Int?;
    flagOpt: Bool?;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            innerOpt: null,
            countOpt: null,
            flagOpt: null
        };
    }
}