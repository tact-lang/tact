struct NestedInit {
    a: Int;
    b: Inner2;
}

struct Inner2 {
    c: Int;
    d: Bool;
}

contract NestedAssign {
    f: NestedInit;

    init() {
        let tmp_inner: Inner2 = Inner2{c:3, d:true};
        self.f = NestedInit{a:5, b:tmp_inner};
    }
}
