struct X { i: Int; }
struct Y { j: Int; x: X; }
struct Z { y: Y; k: Int; }

contract OptDeep {
    val: Z?;

    init() {
        self.val = null;
    }
}
