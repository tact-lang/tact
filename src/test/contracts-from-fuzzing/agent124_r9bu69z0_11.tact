struct Deeper1 { x: Int; }
struct Deeper2 { y: Int; inner: Deeper1; }
struct Deeper3 { z: Int; deeper: Deeper2; }

contract DeepStorage {
    s: Deeper3;
    init() {
        self.s = Deeper3{ z: 9, deeper: Deeper2{ y:8, inner: Deeper1{ x:7 }} };
    }
}