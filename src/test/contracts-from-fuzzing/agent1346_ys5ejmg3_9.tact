struct InnerOpt {
    val: Int?;
}

struct S1 {
    foo: Int;
    bar: Bool;
    nested: InnerOpt;
}

contract NestedOptionalContract {
    s: S1 = S1 { foo: 1, bar: true, nested: InnerOpt{val: null}};
    res: Int? = null;

    init() {
        if (self.s.nested.val != null) {
            self.res = self.s.nested.val;
        } else {
            self.res = 99;
        }
    }
}
