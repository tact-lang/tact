struct Inner { z: Int = 5 }
struct Outer { y: Int; i: Inner }

contract TestContract {
    data: Outer = Outer{ y: 42, i: Inner{} };

    init() {
        self.data = Outer{ y: 100, i: Inner{} };
    }
}