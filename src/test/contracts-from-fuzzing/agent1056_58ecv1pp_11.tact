struct Inner {
    foo: Int;
    bar: Bool?;
}

contract MixedTopLevel {
    s: Inner;
    optInt: Int?;
    optStruct: Inner?;
    s2: Inner;
    flag: Bool;

    init() {
        self.s = Inner{ foo: 1, bar: null };
        self.optInt = null;
        self.optStruct = null;
        self.s2 = Inner{ foo: 2, bar: true };
        self.flag = true;
    }
}