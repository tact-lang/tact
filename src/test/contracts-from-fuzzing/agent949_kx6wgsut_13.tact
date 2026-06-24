struct NestedConvoluted {
    s1: Sub1;
    s2: Sub2;
}

struct Sub1 {
    v1: Int;
    v2: Bool?;
    v3: Sub3;
}

struct Sub3 {
    v: Cell;
}

struct Sub2 {
    inner: Sub4?;
}

struct Sub4 {
    flag: Bool;
    addr: Address;
}

contract ConvolutedTest {
    data: NestedConvoluted;

    init() {
        self.data = NestedConvoluted{
            s1: Sub1{
                v1: 1,
                v2: null,
                v3: Sub3{
                    v: emptyCell()
                }
            },
            s2: Sub2{
                inner: Sub4{
                    flag: true,
                    addr: myAddress()
                }
            }
        };
    }
}
