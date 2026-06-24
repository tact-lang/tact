struct Nested1 {
    x: Int;
    y: Bool;
}

struct Nested2 {
    inner: Nested1;
    flag: Bool;
}

contract TestContract {
    data: Nested2;

    init() {
        self.data = Nested2{
            inner: Nested1{ x: 42, y: false },
            flag: true
        };
    }
}