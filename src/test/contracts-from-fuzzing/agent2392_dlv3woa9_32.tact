struct SuperDeep {
    a: S1;
}
struct S1 {
    b: S2;
}
struct S2 {
    c: S3;
}
struct S3 {
    d: S4;
}
struct S4 {
    e: S5;
}
struct S5 {
    val: Int;
}

contract SuperDeepContract {
    all: SuperDeep = SuperDeep{
        a: S1{
            b: S2{
                c: S3{
                    d: S4{
                        e: S5{ val: 123 }
                    }
                }
            }
        }
    };
}