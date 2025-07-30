contract Test {
    data: Nested1;

    init() {
        self.data = Nested1{
            a: Nested2{
                b: Nested3{
                    c: Nested4{
                        d: 10
                    }
                }
            }
        };
    }
}

struct Nested1 {
    a: Nested2;
}

struct Nested2 {
    b: Nested3;
}

struct Nested3 {
    c: Nested4;
}

struct Nested4 {
    d: Int;
}
