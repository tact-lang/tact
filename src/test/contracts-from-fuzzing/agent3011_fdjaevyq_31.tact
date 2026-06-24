struct L2 { y: Int?; }
struct L1 { z: L2; }

contract OptionalMidLayer {
    foo: L1;
    init() {
        self.foo = L1{ z: L2{ y:null } };
    }
}