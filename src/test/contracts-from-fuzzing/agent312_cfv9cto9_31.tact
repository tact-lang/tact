struct S1 { x: Int }
struct S2 { y: Bool }
struct S3 { z: String }
struct S4 { w: Int }
struct S5 { b: Bool }
struct S6 { s: String }
struct S7 { n: Int }
struct S8 { f: Bool }
struct S9 { m: String }
struct S10 { p: Int }

contract TestContract {
    s1: S1?;
    s2: S2?;
    s3: S3?;
    s4: S4?;
    s5: S5?;
    s6: S6?;
    s7: S7?;
    s8: S8?;
    s9: S9?;
    s10: S10?;
    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = null;
        self.s4 = null;
        self.s5 = null;
        self.s6 = null;
        self.s7 = null;
        self.s8 = null;
        self.s9 = null;
        self.s10 = null;
    }
}