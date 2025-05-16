struct A { x: Int; y: Bool; }
struct B { z: A; }

contract OptsInsideStructs {
    val1: A?;
    val2: B?;

    init() {
        self.val1 = null;
        self.val2 = null;
    }
}