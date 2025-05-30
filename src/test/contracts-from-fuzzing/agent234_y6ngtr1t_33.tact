// Now test optional with serialization of a nested field
struct InnerSer {
    val: Int as uint32;
}

contract NestedOptSer {
    x: InnerSer?;

    init() {
        self.x = null;
    }
}