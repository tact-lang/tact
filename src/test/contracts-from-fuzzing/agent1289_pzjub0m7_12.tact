struct InnerAnn {
    tiny: Int as uint3;
    neg: Int as int7;
}

struct OuterAnn {
    inn: InnerAnn;
    amount: Int as coins;
}

contract NestedAnnotatedStructTest {
    data: OuterAnn;

    init() {
        self.data = OuterAnn{
            inn: InnerAnn{
                tiny: 7,
                neg: -5
            },
            amount: 7000000
        };
    }
}