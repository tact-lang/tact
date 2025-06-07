// Large optional chains nested in struct, contract uses optional of outer
struct Inner {
    fa: Int?;
    fb: Bool?;
    fc: Slice?;
    fd: String?;
}

struct Outer {
    inr: Inner?;
    extra: Int?;
}

contract BigOptionalNest {
    val: Outer?;
    init() {
        self.val = null;
    }
}