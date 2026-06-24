struct Nested2 {
    a: Int?;
    b: Bool;
}

struct Nested1 {
    foo: Nested2;
    bar: Int;
}

contract MultiNestOpt {
    data: Nested1;

    init() {
        self.data = Nested1{
            foo: Nested2{a: null, b: true},
            bar: 123
        };
    }
}