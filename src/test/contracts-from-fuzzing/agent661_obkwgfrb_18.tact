struct Chain1 { x: Int }
struct Chain2 { y: Chain1 }
struct Chain3 { z: Chain2 }
contract NestedDifferent {
    inner: Chain3;
    init() {
        self.inner = Chain3{ z: Chain2{ y: Chain1{ x: 1 } } };
    }
}