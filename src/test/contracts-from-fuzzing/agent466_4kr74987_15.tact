struct S1 { a: Int; }
struct S2 { b: String; }
struct S3 { c: Bool; }
struct Combo {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract ComboStorage {
    persist: Combo;

    init() {
        self.persist = Combo{
            s1: S1{a:123},
            s2: S2{b:"hello"},
            s3: S3{c:true}
        };
    }
}