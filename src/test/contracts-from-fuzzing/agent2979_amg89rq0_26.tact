struct S1 { a:Int }
struct S2 { s:S1 }
struct S3 { s:S2 }

contract DeepAssign {
    var: S3;
    init() {
        self.var = S3{ s: S2{ s: S1{ a:5 } } };
    }
}