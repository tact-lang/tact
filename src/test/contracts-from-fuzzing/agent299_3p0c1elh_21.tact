struct S3 { c: Int }
struct S2 { b: S3 }
struct S1 { a: S2 }

contract TestGetters {
    val: S1;
    init() {
        self.val = S1{a:S2{b:S3{c:11}}};
    }

    get fun get_c(): Int {
        return self.val.a.b.c;
    }
}