struct Layer4 { w: Int; }
struct Layer3 { x: Layer4; }
struct Layer2 { y: Layer3; }
struct Layer1 { z: Layer2; }

contract Deep4Layers {
    nested: Layer1;
    init() {
        self.nested = Layer1{ z: Layer2{ y: Layer3{ x: Layer4{ w: 999 } } } };
    }
}