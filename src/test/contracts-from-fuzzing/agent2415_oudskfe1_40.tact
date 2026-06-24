struct IntStrBool {
    i: Int;
    s: String;
    b: Bool;
}

contract IntStrBoolCont {
    f: IntStrBool;

    init() {
        self.f = IntStrBool{ i:1, s:"s", b:true };
    }
}