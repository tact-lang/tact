struct DeepNested2 { z: Int as uint8; }
struct DeepNested1 { y: DeepNested2; }
struct Container { x: DeepNested1; }

contract TestContract {
    param: Container;

    init() {
        self.param = Container{ x: DeepNested1{ y: DeepNested2{ z: 123 } } };
    }

    receive() {
        // trigger init's initialization
    }
}