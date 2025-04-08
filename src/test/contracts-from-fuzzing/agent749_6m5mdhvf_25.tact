struct A {
    foo: Int?;
}

contract MixedNullable {
    s: A?;
    val: Int?;

    init() {
        self.s = null;
        self.val = 42;
    }
}