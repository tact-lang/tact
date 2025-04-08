struct SChild1 { x: Int; }
struct SChild2 { y: Int; }

struct Parent {
    a: SChild1;
    b: SChild2;
    c: Int;
    d: Bool;
}

contract NestedSiblings {
    data: Parent;
    init() {
        self.data = Parent{
            a: SChild1{ x: 1 },
            b: SChild2{ y: 2 },
            c: 3,
            d: true
        };
    }
}