struct Sub {
    a: Int?;
    b: Bool?;
    c: String;
}

struct Top {
    sub: Sub?;
    d: Int;
}

contract NullMix {
    data: Top;

    init() {
        self.data = Top{
            sub: Sub{
                a: null, // explicit
                // omit b, implicit null
                c: "ok",
            },
            d: 42,
        };
    }

    receive() {}
}