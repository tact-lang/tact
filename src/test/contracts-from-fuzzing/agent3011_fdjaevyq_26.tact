struct OptionalLayer3 { x: Int?; }
struct OptionalLayer2 { y: OptionalLayer3?; }
struct OptionalLayer1 { z: OptionalLayer2?; }

contract OptionalDeep3 {
    foo: OptionalLayer1;
    init() {
        self.foo = OptionalLayer1{ z: null };
    }
}