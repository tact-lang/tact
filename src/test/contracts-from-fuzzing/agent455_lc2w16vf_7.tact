struct S1 { val1: Int; opt1: Bool?;}
struct S2 { s1: S1; opt2: String?;}
struct S3 { s2: S2; val3: Int;}

contract ChainNested {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{val1: 10, opt1: false},
                opt2: "string",
            },
            val3: 33,
        };
    }
}