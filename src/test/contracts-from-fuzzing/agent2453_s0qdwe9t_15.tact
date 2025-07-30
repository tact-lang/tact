struct OptString {
    s: String?;
}

contract OptInStruct {
    f: OptString;
    init() {
        self.f = OptString{s:null};
    }
}