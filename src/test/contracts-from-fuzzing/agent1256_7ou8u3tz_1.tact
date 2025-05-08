struct Nested1 {
    x: Int;
}

struct Nested2 {
    n1: Nested1;
}

contract DeepTest {
    value: Nested2;

    init() {
        self.value = Nested2 { n1: Nested1 { x: 5 } };
    }
}