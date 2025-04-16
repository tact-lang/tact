struct Nested1 { x: Int; y: Bool; }
struct Nested2 { z: Nested1; w: String?; }

contract MultiNested {
    m: Nested2;

    init() {
        self.m = Nested2{
            z: Nested1{ x: 1, y: false },
            w: null
        };
    }
}