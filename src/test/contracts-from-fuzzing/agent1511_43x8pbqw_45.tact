struct IntBoolString {
    i: Int;
    b: Bool;
    s: String;
}

contract IntBoolStruct {
    f: IntBoolString;
    init() {
        self.f = IntBoolString{ i:123, b:true, s:"abc" };
    }
}