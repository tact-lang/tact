struct InnerS {
    a: Int;
    b: Bool;
}

struct MidS {
    x: InnerS;
    y: Bool;
}

contract NestedMixed {
    m: MidS = MidS{
        x: InnerS{ a: 123, b: false },
        y: true
    };
    receive() {
        let _ = self.m.x.b;
    }
}