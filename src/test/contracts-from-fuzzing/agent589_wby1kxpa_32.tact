struct InnerS {
    a: Int;
}

struct MiddleS {
    b: InnerS;
}

contract Test {
    val: MiddleS?;

    init() {
        self.val = MiddleS{
            b: InnerS{ a: 1 }
        };
    }
}