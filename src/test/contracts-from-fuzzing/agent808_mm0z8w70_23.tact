struct InnerX {
    x: Int;
}

struct OuterY {
    y: InnerX;
}

struct WrapperZ {
    z: OuterY;
}

contract WrapperTest {
    data: WrapperZ;

    init() {
        self.data = WrapperZ{ z: OuterY{ y: InnerX{ x:123 } } };
    }
}