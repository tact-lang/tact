struct NestedMany {
    s1: S;
    s2: S;
    s3: S;
}

struct S {
    a: Int;
    b: Int;
    c: Int;
}

contract NestedManyTest {
    field: NestedMany;

    init() {
        self.field = NestedMany{
            s1: S{a:1,b:2,c:3},
            s2: S{a:4,b:5,c:6},
            s3: S{a:7,b:8,c:9},
        };
    }
}