struct BoolAndInt {
    flag: Bool;
    num: Int;
}

struct NestedWithBoolInt {
    inner: BoolAndInt;
    optInner: BoolAndInt?;
}

contract MixOptionalStorage {
    data: NestedWithBoolInt;
    init() {
        self.data = NestedWithBoolInt{
            inner: BoolAndInt{flag: true, num: 12},
            optInner: BoolAndInt{flag: false, num: 34}
        };
    }
}