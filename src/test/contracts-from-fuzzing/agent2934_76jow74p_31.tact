struct A {
    x: Int;
}

contract OptInitNull {
    s: A?;

    init() {
        self.s = null;
    }
}