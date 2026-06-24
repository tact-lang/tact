struct S1 {
    intVal: Int;
}

struct S2 {
    f1: S1;
    f2: S1;
}

struct S3 {
    val: S2;
}

contract SameStructsNested {
    data: S3;

    init() {
        self.data = S3{
            val: S2{
                f1: S1{intVal: 1},
                f2: S1{intVal: 2}
            }
        };
    }
}