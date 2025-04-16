struct Inner { z: Int }
struct Outer { x: Int; y: Inner? }

contract TestContract {
    data: Outer = Outer{ x: 1, y: null };

    init() {
        self.data = Outer{ x: 42, y: Inner{ z: 99 } };
    }
}