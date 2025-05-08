struct DeepOptionals {
    a: Int?;
    b: Int?;
    c: DeepInner?;
}

struct DeepInner {
    d: Bool?;
    e: Int?;
}

contract TestContract {
    v: DeepOptionals;

    init() {
        self.v = DeepOptionals{
            a: null,
            b: 123,
            c: DeepInner{
                d: true,
                e: null
            }
        };
    }
}