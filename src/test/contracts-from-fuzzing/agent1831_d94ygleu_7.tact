struct InnerMost { z: String }
struct Mid { y: InnerMost }
struct Outer { x: Mid }

contract OptDeep {
    foo: Outer?;

    init() {
        self.foo = null;
    }
}