struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    x: Bool;
}

struct S3 {
    s2: S2;
    y: Int;
}

contract TripleNestedContract {
    val: S3;

    init() {
        self.val = S3{
            s2: S2{
                s1: S1{a:123},
                x:true
            },
            y:456
        };
    }
}