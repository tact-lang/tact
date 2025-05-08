struct Nested1 {
    x: Int;
}

struct Nested2 {
    n: Nested1;
    y: String;
}

contract TestContract {
    f: Nested2;

    init() {
        self.f = Nested2{
            n: Nested1{ x: 42 },
            y: "hello",
        };
    }
}