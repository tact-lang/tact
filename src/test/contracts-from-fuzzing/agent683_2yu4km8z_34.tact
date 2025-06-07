struct A {
    x: Int;
    y: Int;
}

contract OptionalStructField {
    a: A?;

    init() {
        self.a = null;
    }
}