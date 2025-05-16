struct InnerSeq {
    a: Int;
    b: Bool;
}

struct OuterSeq {
    x: InnerSeq;
    y: Bool;
    z: InnerSeq;
}

contract SeqNestedStructs {
    val: OuterSeq;

    init() {
        self.val = OuterSeq{
            x: InnerSeq{ a: 1, b: true },
            y: false,
            z: InnerSeq{ a: 2, b: false },
        };
    }
}
