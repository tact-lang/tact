struct Layer1 { x: Int }
struct Layer2 { y: Layer1 }
struct Layer3 { z: Layer2 }

contract ChainNested {
    deep: Layer3;

    init() {
        self.deep = Layer3{ z: Layer2{ y: Layer1{ x: 111 } } };
    }
}