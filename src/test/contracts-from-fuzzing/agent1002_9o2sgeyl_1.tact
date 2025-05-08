struct Nested1 {
    foo: Int;
    bar: Bool;
}

struct Nested2 {
    nested: Nested1;
    flag: Bool;
}

contract DeepContract {
    data: Nested2;

    init() {
        self.data = Nested2{ nested: Nested1{ foo: 10, bar: false }, flag: true };
    }
}