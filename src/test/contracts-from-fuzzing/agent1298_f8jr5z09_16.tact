struct StrNest1 { s: String }
struct StrNest2 { inner: StrNest1 }
struct StrNest3 { inner2: StrNest2 }

contract TestStrNest {
    val: StrNest3;
    init() {
        self.val = StrNest3{inner2: StrNest2{inner: StrNest1{s: "deep"}}};
    }
}