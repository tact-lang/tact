struct InnerMost { z: Int }
struct Inner { y: InnerMost }
struct Middle { x: Inner }
struct Outer { m: Middle }

contract NestedAssignment {
    v: Outer;

    init() {
        self.v = Outer{ m: Middle{ x: Inner{ y: InnerMost{ z: 55 }}}};
    }
}