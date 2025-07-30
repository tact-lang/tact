struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    s1: S1;
    txt: String;
}

struct S3 {
    a: S2;
    b: S2;
}

contract MultiStructs {
    state: S3;

    init() {
        self.state = S3{
            a: S2{ s1: S1{x:1,y:true}, txt:"hi" },
            b: S2{ s1: S1{x:2,y:false}, txt:"bye" }
        };
    }
}
