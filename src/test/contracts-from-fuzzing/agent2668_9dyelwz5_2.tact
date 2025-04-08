struct Inner { x: Int; y: Int; z: Bool; }
struct Outer { i: Int; inner: Inner; flag: Bool; }

contract NestedStructsTest {
    data: Outer;

    init() {
        self.data = Outer{ i: 42, inner: Inner{ x:1, y:2, z:true }, flag: false };
    }
}
