struct S1 {
    flag: Bool;
}

struct S2 {
    s1: S1;
    text: String;
}

struct S3 {
    s2: S2;
    addr: Address;
}

struct S4 {
    s3: S3;
    n: Int;
}

contract TestContract {
    val: S4;
    
    init() {
        self.val = S4{
            s3: S3{
                s2: S2{
                    s1: S1{flag:true},
                    text:"deep"
                },
                addr: myAddress()
            },
            n: 256
        };
    }
}
