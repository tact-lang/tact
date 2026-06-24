struct X { inner: Y; }
struct Y { val: Int; }

contract NestedNull {
    val: X?;
    init() {
        self.val = null;
    }
}
