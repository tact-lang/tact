struct DoubleNested {
    a: Inner;
    b: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract StructOfStructs {
    st: DoubleNested;

    init() {
        self.st = DoubleNested{
            a: Inner{ x:1, y:true },
            b: Inner{ x:2, y:false }
        };
    }
}