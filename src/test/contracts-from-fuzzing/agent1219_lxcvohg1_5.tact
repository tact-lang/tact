struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: String;
    d: Address;
}

struct S3 {
    e: Int?;
    f: S1;
    g: S2;
    h: Bool?;
}

contract TestContract {
    data: S3;

    init() {
        self.data = S3{
            e: null,
            f: S1{a:7, b:true},
            g: S2{c:"hi", d:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")},
            h: null
        };
    }
}