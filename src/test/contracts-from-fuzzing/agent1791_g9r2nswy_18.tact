struct S0 {
    a: Bool;
}

struct S1 {
    b: S0;
}

struct S2 {
    c: S1;
}

struct S3 {
    d: S2;
}

struct S4 {
    e: S3;
}

struct S5 {
    f: S4;
}

contract Test19 {
    x: S5 = S5{
        f: S4{
            e: S3{
               d: S2{
                  c: S1{
                     b: S0{ a: true }
                  }
               }
            }
        }
    };
    init() {}
}
