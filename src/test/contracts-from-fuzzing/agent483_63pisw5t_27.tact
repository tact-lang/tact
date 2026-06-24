struct BigNested {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    v1: Int;
    s1: String;
    optInner: Inner3?;
}

struct Inner2 {
    addr: Address;
    b: Bool;
}

struct Inner3 {
    flag: Bool;
    x: Int;
}

contract BigNestTest {
    n: BigNested;

    init() {
        self.n = BigNested{
            inner1: Inner1{
                v1:1,s1:"hello",optInner:null
            },
            inner2: Inner2{
                addr:myAddress(),b:true
            }
        };
    }
}
