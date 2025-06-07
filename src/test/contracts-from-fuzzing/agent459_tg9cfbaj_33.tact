struct InnerS { foo: Int }
message(123) InnerM { bar: Bool }
message(124) OptM { baz: String }

struct ComboAll {
    prim: Int;
    opt: Int?;
    s: InnerS;
    m: InnerM;
    om: OptM?;
}

contract AllTypesMix {
    data: ComboAll = ComboAll{
        prim: 1,
        opt: null,
        s: InnerS{ foo:2 },
        m: InnerM{ bar:true },
        om: null
    };

    init() {
        self.data = ComboAll{
            prim: 10,
            opt: 20,
            s: InnerS{ foo:30 },
            m: InnerM{ bar:false },
            om: OptM{ baz:"done" }
        };
    }
}