struct M1 {
    a:Int;
    b:String;
}

struct M2 {
    m1:M1;
    ok: Bool;
}

struct M3 {
    m2:M2;
    note: String;
}

contract DeeplyMixed {
    deepField: M3;

    init() {
        self.deepField = M3{
            m2: M2{
                m1: M1{
                    a:123, b:"deep"
                },
                ok: true
            },
            note: "zzz"
        };
    }
}