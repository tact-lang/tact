struct S1 {
    a: Int;
    b: Bool?;
}

struct S2 {
    s1: S1;
    val: String;
}

struct S3 {
    s2: S2;
    c: Cell;
}

struct S4 {
    s3: S3;
    d: Slice;
}

contract Test5 {
    s4: S4;
    init() {
        self.s4 = S4{
            s3: S3{
                s2: S2{
                    s1: S1{a:1,b:null},
                    val: "hi"
                },
                c: emptyCell()
            },
            d: emptyCell().asSlice()
        };
    }
}