struct S1 {
    a: Int?;
}

struct S2 {
    b: S1;
}

contract NestedOptionalsContract {
    val: S2;

    init() {
        self.val = S2 { b: S1 { a: null } };
    }
}