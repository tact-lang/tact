struct S1 {
    sub: S2;
    optionalSub: S2?;
}

struct S2 {
    leaf: Int;
}

contract MultiOptNested {
    field: S1;
    init() {
        self.field = S1{
            sub: S2{ leaf: 5 },
            optionalSub: null
        };
    }
    receive() {
        let _ = self.field.sub.leaf;
        if (self.field.optionalSub != null) {
            let _ = self.field.optionalSub!!;
        }
    }
}