struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: Sub?;
}

struct Sub {
    val: Int;
}

contract Test {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            a: null,
            b: true,
            c: Sub{val:99}
        };
    }
}