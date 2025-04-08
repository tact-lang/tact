struct S1 {
    i: Int;
    s2: S2;
}

struct S2 {
    j: Int;
    s3: S3;
}

struct S3 {
    flag: Bool;
    s4: S4;
}

struct S4 {
    text: String;
    s5: S5;
}

struct S5 {
    opt: Int?;
}

contract StorageChainNested {
    data: S1;

    init() {
        self.data = S1{
            i:1,
            s2:S2{
                j:2,
                s3:S3{
                    flag: true,
                    s4:S4{
                        text:"hello",
                        s5:S5{
                            opt:null
                        }
                    }
                }
            }
        };
    }
}