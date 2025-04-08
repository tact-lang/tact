struct Inner { x: Int; y: Int; }

struct Middle { inner: Inner; z: Int; }

contract DeepNest {
    data: Middle;

    init() {
        self.data = Middle{ inner: Inner{ x: 1, y: 2 }, z: 3 };
    }
}