message(1) M1 { val: Int }

struct S3 {
    m: M1;
    v: Int;
}

struct S2 {
    o: S3?;
}

struct S1 {
    inner: S2;
    flag: Bool;
}

contract Combo {
    s: S1;
    init() {
        self.s = S1{
            inner: S2{
                o: null
            },
            flag: true
        };
    }
}
