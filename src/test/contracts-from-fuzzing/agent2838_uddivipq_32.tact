struct InnerMost { z: Int; }
struct Inner { y: InnerMost; }
struct Outer { x: Inner; }

contract NestedStructFields {
    s: Outer;

    init() {
        self.s = Outer {
            x: Inner {
                y: InnerMost {
                    z: 123
                }
            }
        };
    }
}