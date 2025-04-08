struct Nested1 { x: Int; y: Int; }

struct Nested2 { z: Int; nested1: Nested1; }

contract TestNestedStructs {
    data: Nested2;

    init() {
        self.data = Nested2{ z: 5, nested1: Nested1{ x: 1, y: 2 } };
    }
}