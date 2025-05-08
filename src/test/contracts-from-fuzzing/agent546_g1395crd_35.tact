struct S10 { v: Int? = null; }
struct S9 { s: S10 = S10{}; }
struct S8 { s: S9 = S9{}; }
struct S7 { s: S8 = S8{}; }
struct S6 { s: S7 = S7{}; }
struct S5 { s: S6 = S6{}; }
struct S4 { s: S5 = S5{}; }
struct S3 { s: S4 = S4{}; }
struct S2 { s: S3 = S3{}; }
struct S1 { s: S2 = S2{}; }

contract DeepDefaultsChain {
    root: S1;

    init() {
        self.root = S1{};
    }
}
