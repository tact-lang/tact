struct Inner {
    v: Int as uint8;
    flag: Bool;
}

struct Combo {
    inner: Inner;
    optInt: Int?;
    optStruct: Inner?;
}

contract TestContract {
    data: Combo;

    init() {
        self.data = Combo{
            inner: Inner{ v: 1, flag: false },
            optInt: null,
            optStruct: Inner{ v: 2, flag: true }
        };
    }
}
