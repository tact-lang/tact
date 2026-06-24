struct Nested1 { x: Int; }
struct Nested2 { y: Bool; n1: Nested1; }
struct Nested3 { z: Int?; n2: Nested2; }

contract FuzzTest {
    data: Nested3;

    init() {
        self.data = Nested3{
            z: null,
            n2: Nested2{ y: true, n1: Nested1{ x: 7 } }
        };
    }
}