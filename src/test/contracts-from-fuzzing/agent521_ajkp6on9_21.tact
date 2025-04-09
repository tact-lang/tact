struct InnerA {
    x: Int;
    opt: String?;
}

struct InnerB {
    flag: Bool;
    msg: InnerA;
}

contract DoubleNested {
    state: InnerB;

    init() {
        self.state = InnerB{
            flag: true,
            msg: InnerA{
                x: 9,
                opt: null,
            }
        };
    }
}