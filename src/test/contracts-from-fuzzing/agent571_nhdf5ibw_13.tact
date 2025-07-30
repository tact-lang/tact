struct Inner { val: Int; }

struct ComplexOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Inner?;
}

contract TestContract {
    data: ComplexOpt;

    init() {
        self.data = ComplexOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}