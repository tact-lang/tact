struct StrNest1 {
    a: String;
}

struct StrNest2 {
    sn1: StrNest1;
}

struct StrNest3 {
    sn2: StrNest2;
    b: String;
}

contract StringDeepNest {
    data: StrNest3;
    init() {
        self.data = StrNest3{
            sn2: StrNest2{
                sn1: StrNest1{
                    a: "hi"
                }
            },
            b: "end"
        };
    }
}