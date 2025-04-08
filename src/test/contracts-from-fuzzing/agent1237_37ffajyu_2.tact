struct Nested1 {
    x: Int;
    y: Bool;
}

struct Nested2 {
    n: Nested1;
    s: String;
}

contract Test2 {
    data: Nested2;

    init() {
        self.data = Nested2 {
            n: Nested1 { x: 7, y: true },
            s: "abc"
        };
    }
}