struct Nested1 {
    f1: Int;
    f2: Bool;
}

struct Nested2 {
    n1: Nested1;
    extra: Int;
}

contract StorageTest {
    data: Nested2;
    init() {
        self.data = Nested2{
            n1: Nested1{f1: 1, f2: true},
            extra: 42
        };
    }
}
