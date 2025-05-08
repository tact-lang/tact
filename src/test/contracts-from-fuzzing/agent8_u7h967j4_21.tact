struct A1{ x: Int }
struct A2{ y: A1 }
struct A3{ z: A2 }
struct A4{ w: A3 }

contract Deep4Layer {
    s: A4;
    init() {
        self.s = A4{ w: A3{ z: A2{ y: A1{ x: 42 } } } };
    }
}