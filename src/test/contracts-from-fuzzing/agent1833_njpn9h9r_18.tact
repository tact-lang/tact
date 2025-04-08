struct Leaf { val: Int as uint16; }
struct Mid { inner: Leaf; }
struct Root { child: Mid; }

contract NestedSerialization {
    s: Root;
    init() {
        self.s = Root { child: Mid { inner: Leaf { val: 42 } } };
    }
}
