struct IntAndBool {
    i1: Int;
    i2: Int;
    i3: Int;
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
}

contract MixedPrimitives {
    storage: IntAndBool;

    init() {
        self.storage = IntAndBool{
            i1: 1, i2: 2, i3: 3,
            flag1: true, flag2: false, flag3: true
        };
    }
}