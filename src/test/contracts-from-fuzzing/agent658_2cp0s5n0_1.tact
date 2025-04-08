struct Nested1 {
    x: Int;
    y: Bool;
}

struct Nested2 {
    p: Nested1;
    q: Bool;
}

contract Test {
    data: Nested2;

    init() {
        self.data = Nested2{p: Nested1{x: 7, y: false}, q: true};
    }
}