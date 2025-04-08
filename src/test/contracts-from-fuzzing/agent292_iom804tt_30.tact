struct InnerMost { z: Int }
struct Inner { y: InnerMost }
struct Middle { x: Inner }

contract Depth4 {
    val: Middle;

    init() {
        self.val = Middle{ x: Inner{ y:InnerMost{z:123} } };
    }
}