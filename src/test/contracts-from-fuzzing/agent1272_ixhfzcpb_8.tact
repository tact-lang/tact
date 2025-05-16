struct S1 {
    intVal: Int;
}

struct S2 {
    s1Val: S1;
    optInt: Int?;
}

struct S3 {
    s2Val: S2;
    optS1: S1?;
}

contract OptionalDeep {
    val: S3;
    init() {
        self.val = S3{
            s2Val: S2{
                s1Val: S1{intVal: 5},
                optInt: null
            },
            optS1: null
        };
    }
}
