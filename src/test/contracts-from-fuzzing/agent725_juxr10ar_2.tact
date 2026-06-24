struct Nested1 {
    a: Int;
    b: Bool;
}

struct Nested2 {
    x: Nested1;
    y: Int;
}

contract NestedContract {
    data: Nested2;

    init() {
        self.data = Nested2{
            x: Nested1{a: 1, b: true},
            y: 2
        };
    }
}