struct OptNest {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Holder {
    d: Int;
    e: OptNest;
}

contract NestedOptionals {
    data: Holder;

    init() {
        self.data = Holder{
            d: 99,
            e: OptNest{
                a: null,
                b: null,
                c: null
            }
        };
    }
}