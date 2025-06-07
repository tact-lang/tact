// struct with many nested optionals and defaults
struct S1 {
    a: Int = 1;
    b: Int? = null;
    c: Bool? = null;
    d: String = "test";
    e: String? = null;
    f: Bool = true;
}

struct S2 { s1: S1; s1Opt: S1?; }

contract TestContract {
    val: S2;
    init() {
        self.val = S2 {
            s1: S1 {},
            s1Opt: null
        };
    }
}