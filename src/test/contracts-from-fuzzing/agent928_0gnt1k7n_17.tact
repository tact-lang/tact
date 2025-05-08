struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: Int?;
    d: String?;
    e: S1;
}

contract MixedContract {
    field: S2;

    init() {
        self.field = S2{
            c: null,
            d: null,
            e: S1{a:1,b:true}
        };
    }
}