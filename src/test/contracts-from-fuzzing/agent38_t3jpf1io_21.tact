struct Wrap1 { x: Int; }
struct Wrap2 { y: Wrap1; }
struct Wrap3 { z: Wrap2; }

contract TransitiveNested {
    val: Wrap3;

    init() {
        self.val = Wrap3{ z: Wrap2{ y: Wrap1{ x: 42 } } };
    }
}