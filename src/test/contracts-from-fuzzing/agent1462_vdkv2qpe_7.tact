struct S1 { f1: Int?; }
struct S2 { f2: S1?; }

contract TestOptWrap {
    wrapper: S2;

    init() {
        self.wrapper = S2{ f2: null };
    }
}