struct W { s: String }
struct X { i: Int }
struct Y { b: Bool }
struct Z { addr: Address }

struct NestedMultiType {
    w: W;
    x: X;
    y: Y;
    z: Z;
}

contract NestedMultiTypeTest {
    s: NestedMultiType;
    init() {
        self.s = NestedMultiType {
            w: W { s: "abc" },
            x: X { i: 5 },
            y: Y { b: true },
            z: Z { addr: myAddress() }
        };
    }
}