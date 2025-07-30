struct OptionalIntDeep {
    a: Int?;
    b: Int?;
    c: OptInner?;
}

struct OptInner {
    d: Int?;
    e: Int?;
}

contract OptionalIntDeepTest {
    data: OptionalIntDeep;

    init() {
        self.data = OptionalIntDeep{
            a: null,
            b: 1,
            c: OptInner{
                d: null,
                e: 2
            }
        };
    }
}
