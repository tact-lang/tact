struct InnerNested {
    a: Int;
    b: Bool;
}

struct MidNested {
    m: InnerNested;
    s: String?;
}

struct OuterNested {
    o: MidNested;
    flag: Bool;
}

contract MultiLayered {
    val: OuterNested;

    init() {
        self.val = OuterNested{
            o: MidNested{
                m: InnerNested{ a:5, b:true },
                s: null
            },
            flag:false
        };
    }
}