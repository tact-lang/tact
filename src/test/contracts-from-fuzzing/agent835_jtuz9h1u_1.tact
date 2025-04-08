struct NestedStructA {
    inner: Int;
    optInner: Int?;
}

struct NestedStructB {
    sa: NestedStructA;
    sb: NestedStructA;
    flag: Bool;
}

contract DeepNestedContract {
    data: NestedStructB;

    init() {
        self.data = NestedStructB{
            sa: NestedStructA{ inner: 1, optInner: null },
            sb: NestedStructA{ inner: 2, optInner: 3 },
            flag: true,
        };
    }
}