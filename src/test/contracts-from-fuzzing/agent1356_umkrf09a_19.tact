struct Complex {
    a: Int;
    b: Bool;
    c: String?;
    d: Address; 
    e: Cell?;
}

struct OuterWrap {
    one: Complex;
    two: Complex?;
}

contract NestedMix {
    state: OuterWrap;

    init() {
        self.state = OuterWrap{
            one: Complex{
                a: 1,
                b: true,
                c: null,
                d: myAddress(),
                e: null,
            },
            two: null,
        };
    }
}
