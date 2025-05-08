struct Layer3 { x: Int; }
struct Layer2 { y: Layer3; }
struct Layer1 { z: Layer2; }

contract StructDeep3 {
    foo: Layer1;
    init() {
        self.foo = Layer1{ z: Layer2{ y: Layer3{ x: 123 } } };
    }
}