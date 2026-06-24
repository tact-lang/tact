struct S5 { f: Int?; }
struct S4 { s: S5?; }
struct S3 { s: S4?; }
struct S2 { s: S3?; }
struct S1 { s: S2?; }

contract AllOptionalsNested {
    data: S1;

    init() {
        self.data = S1{ s: null };
    }
}