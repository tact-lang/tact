struct MultiNested {
    a: Nested1;
    b: Int;
    c: Nested2;
}

struct Nested1 {
    x: Int;
    y: Bool;
}

struct Nested2 {
    z: String;
}

contract MultiNest {
    store: MultiNested;
    init() {
        self.store = MultiNested{
            a: Nested1{ x:1, y:false },
            b:2,
            c: Nested2{ z:"hi" }
        };
    }
}