struct OptionalDefaulted {
    a: Int?;
    b: Bool?;
}

contract OptionalDefaultedStruct {
    f: OptionalDefaulted;
    init() {
        self.f = OptionalDefaulted{a:null, b:null};
    }
}