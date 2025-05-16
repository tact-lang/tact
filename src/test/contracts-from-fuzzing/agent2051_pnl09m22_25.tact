struct A {
    x: Int;
}

contract OptStructNullInit {
    a: A?;

    init() {
        self.a = null;
    }
}