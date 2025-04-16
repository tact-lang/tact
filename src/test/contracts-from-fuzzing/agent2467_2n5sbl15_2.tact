struct Inner { x: Int; y: Int?; }
struct Middle { inner: Inner; z: Int?; }

contract DeepNested {
    data: Middle;
    init() {
        self.data = Middle{
            inner: Inner{ x: 1, y: null },
            z: null
        };
    }
}