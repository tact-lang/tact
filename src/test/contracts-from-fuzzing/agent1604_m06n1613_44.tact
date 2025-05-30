struct A {
    val: Int;
}

contract TestNull {
    a: A?;
    init() {
        self.a = null;
    }
    receive() {}
}