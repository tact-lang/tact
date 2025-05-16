struct SInner {
    a: Int;
    b: Bool?;
}

struct SMiddle {
    a: SInner?;
    b: Bool?;
}

contract OptionalNested {
    storage: SMiddle?;
    init() {
        self.storage = SMiddle{
            a: SInner{
                a: 55,
                b: null
            },
            b: true
        };
    }
}