struct OptBool {
    v: Bool?;
}

struct OptInner {
    p: OptBool;
    f: Int;
}

contract OptStructs {
    data: OptInner;

    init() {
        self.data = OptInner{
            p: OptBool{v:null},
            f: 12
        };
    }
}