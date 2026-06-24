struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: NestedInner?;
}

struct NestedInner {
    s: String?;
    addr: Address?;
}

contract Test9 {
    val: NestedOptionals;
    init() {
        self.val = NestedOptionals{
            a:null,
            b:null,
            c:NestedInner{s:null, addr:null}
        };
    }
}