struct Simple {
    val: Int = 7;
}

contract NullDefault {
    foo: Simple? = null;
    init() {
        self.foo = null;
    }
}