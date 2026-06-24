struct MultiBoolOpt {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
}

contract ManyOptionals {
    data: MultiBoolOpt;

    init() {
        self.data = MultiBoolOpt{
            a: null,
            b: true,
            c: false,
            d: null,
            e: true,
        };
    }
}