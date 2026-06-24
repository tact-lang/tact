struct Inner1 { x: Int; }
struct Inner2 { y: Bool; }

struct Middle {
    a: Inner1;
    b: Inner2;
}

contract NestedLayers {
    layer: Middle;

    init() {
        self.layer = Middle{ a: Inner1{x: 10}, b: Inner2{y: false} };
    }
}