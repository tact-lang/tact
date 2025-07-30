struct MultiLayer {
    a: Int;
}

struct Container1 {
    v: MultiLayer;
}

struct Container2 {
    w: Container1;
}

contract MultiNest {
    data: Container2;

    init() {
        self.data = Container2{
            w: Container1{
                v: MultiLayer{ a: 42 },
            },
        };
    }
}