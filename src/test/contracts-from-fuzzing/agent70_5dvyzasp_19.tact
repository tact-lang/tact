struct OptStrBool {
    sb: SubSB?;
}

struct SubSB {
    a: String;
    b: Bool;
}

contract TT {
    s: OptStrBool;

    init() {
        self.s = OptStrBool{
            sb: null
        };
    }
}