// Nest level and option test with maximal diversity
struct SInner {
    n: Int;
    flag: Bool?;
    s: String;
}

struct SMid {
    inner: SInner?;
    val: Int?;
    b: Bool;
}

contract ComplexMix {
    f1: SMid?;
    f2: Bool;
    f3: String?;
    f4: Int?;

    init() {
        self.f1 = SMid{
            inner: null,
            val: null,
            b: true
        };
        self.f2 = false;
        self.f3 = "text";
        self.f4 = null;
    }
}
