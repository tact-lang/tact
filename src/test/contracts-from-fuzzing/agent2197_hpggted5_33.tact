struct ManyNested {
    a: Int;
    b: Nested1;
    c: Nested2;
}

struct Nested1 {
    x: Int;
}

struct Nested2 {
    y: Bool;
}

contract MultiNestFields {
    store: ManyNested;

    init() {
        self.store = ManyNested{
            a: 5,
            b: Nested1{ x:7 },
            c: Nested2{ y:true }
        };
    }
}