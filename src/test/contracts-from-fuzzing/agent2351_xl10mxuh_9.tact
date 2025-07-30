struct S1 {
    i: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    txt: String;
}

struct S3 {
    s2: S2;
    addr: Address;
    flag: Bool;
    num: Int;
}

contract WideNested {
    field: S3;

    init() {
        self.field = S3{
            s2: S2{ s1: S1{ i: 1, b: true }, txt: "x" },
            addr: myAddress(),
            flag: false,
            num: 0
        };
    }
}
