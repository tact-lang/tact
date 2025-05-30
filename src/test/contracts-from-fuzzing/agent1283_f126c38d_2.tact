struct InnerMost { z: Int; }

struct Middle { b: Bool; c: InnerMost; }

struct Outer { a: Int; inner: Middle; }

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            a: 1,
            inner: Middle{ b: true, c: InnerMost{z: 42} }
        };
    }
}