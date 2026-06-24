struct Nested {
    i: Int;
    s: String;
}

contract TestContract {
    value1: Int = 1;
    value2: Int?;
    flag: Bool;
    optInner: Nested?;

    init() {
        self.value2 = null;
        self.flag = true;
        self.optInner = null;
    }
}