struct SN1 {
    a: Int;
}

struct SN2 {
    a: Int;
    b: SN1;
}

struct SN3 {
    c: SN2;
    d: Bool;
}

contract DeepFields {
    val: SN3;

    init() {
        self.val = SN3{
            c: SN2{
                a:10,
                b: SN1{ a: 5 }
            },
            d: true
        };
    }
}