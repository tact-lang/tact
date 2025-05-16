struct OptSliceAndStr {
    s: Slice?;
    t: String?;
}

contract OptSliceStrField {
    f: OptSliceAndStr;

    init() {
        self.f = OptSliceAndStr{s:null,t:null};
    }
}