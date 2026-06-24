struct DefVals {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultsStructTest {
    s: DefVals;

    init() {
        self.s = DefVals{ d:null, e:null, f:null };
    }
}