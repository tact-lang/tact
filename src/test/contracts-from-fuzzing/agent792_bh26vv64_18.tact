struct Inner {
    n: Int;
}

contract TestContract {
    small: Int as uint12;
    optInt: Int?;
    optStruct: Inner?;

    init() {
        self.small = 100;
        self.optInt = null;
        self.optStruct = Inner{ n: 77 };
    }
}