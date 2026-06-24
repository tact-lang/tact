struct InnerA {
    a: Int;
}

struct InnerB {
    b: Bool;
}

struct Wrap {
    innerA: InnerA?;
    innerB: InnerB?;
}

contract OptMultipleInner {
    val: Wrap;

    init() {
        self.val = Wrap{
            innerA: null,
            innerB: null
        };
    }
}