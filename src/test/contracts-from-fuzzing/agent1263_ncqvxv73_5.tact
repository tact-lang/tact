struct InnerMost { z: Int; }
struct Inner { y: InnerMost; }
struct Middle { x: Inner; }
struct Outer { w: Middle; }

contract Test {
    data: Outer;

    init() {
        self.data = Outer{w: Middle{x: Inner{y: InnerMost{z: 123}}}};
    }
}