struct S1 {
    b: Bool;
}
struct S2 {
    s1: S1;
    optS1: S1?;
}

contract NestedOptionalStruct {
    val: S2;

    init() {
        self.val = S2{
            s1: S1{ b: false },
            optS1: S1{ b: true }
        };
    }

    receive() {
        let v = self.val.optS1;
        if (v != null) {
            let inner = v!!;
            let b = inner.b;
        }
    }
}
