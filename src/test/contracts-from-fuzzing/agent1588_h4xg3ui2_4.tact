struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: String?;
    d: InnerOpt?;
}

struct InnerOpt {
    q: Int;
    w: Bool;
}

contract OptTest {
    value: OptionalNest;
    
    init() {
        self.value = OptionalNest{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}