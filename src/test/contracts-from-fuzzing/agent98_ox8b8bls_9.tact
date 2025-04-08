struct DeepA { x: Int; }
struct DeepB { y: DeepA; }
struct DeepC { z: DeepB; }
struct DeepD { w: DeepC; }

contract FourDeep {
    nested: DeepD;
    init() {
        self.nested = DeepD{ w: DeepC{ z: DeepB{ y: DeepA{ x: 42 } } } };
    }
}