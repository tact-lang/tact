struct Foo { x: Int; }

contract Test {
    val: Foo?;

    init() {
        self.val = null;
    }
}