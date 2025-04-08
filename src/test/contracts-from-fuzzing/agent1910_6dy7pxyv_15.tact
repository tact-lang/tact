struct InnerOpt {
    fld: Int?;
}

contract OptInStruct {
    f: InnerOpt?;

    init() {
        self.f = null;
    }
}
