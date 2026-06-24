struct OptionalStrBool {
    s: String?;
    b: Bool?;
}

contract OptStrBoolCont {
    f: OptionalStrBool;

    init() {
        self.f = OptionalStrBool{ s:null, b:true };
    }
}