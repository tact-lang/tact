struct NestedInner { a: Int; b: Bool; }

struct NestedOuter { x: Int; y: NestedInner; z: Int; }

contract DeepNestedTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            x: 1,
            y: NestedInner{ a: 2, b: true },
            z: 3,
        };
    }

    receive() {
        self.data;
    }
}