struct S1 {
    val: Int;
}

struct S2 {
    nested: S1;
}

struct S3 {
    nested: S2;
}

struct S4 {
    nested: S3;
}

contract Deep4Nesting {
    pl: S4;

    init() {
        self.pl = S4{
            nested: S3{
                nested: S2{
                    nested: S1{ val: 99 }
                }
            }
        };
    }
}