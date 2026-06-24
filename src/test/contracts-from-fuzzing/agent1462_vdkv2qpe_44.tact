// intentionally large struct chain with multiple optionals
struct S1 { f: Int?; }
struct S2 { s1: S1?; }
struct S3 { s2: S2?; }
struct S4 { s3: S3?; }
struct S5 { s4: S4?; }
struct S6 { s5: S5?; }

contract OptionalsStack {
    s6: S6?;

    init() {
        self.s6 = null;
    }
}