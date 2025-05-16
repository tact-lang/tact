struct NestedOptional {
    a: Int?;
    b: Bool?;
    s: String?;
}

struct Wrapper {
    inner: NestedOptional;
}

contract HasNestedOpt {
    w: Wrapper;
    init() {
        self.w = Wrapper{ inner: NestedOptional{ a:null, b:null, s:null } };
    }
}
