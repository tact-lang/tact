struct A {
    x: Int;
}

struct B {
    sub: A?;
    y: Bool;
}

contract OptStructField {
    val: B;
    init() {
        self.val = B{ sub: null, y: true };
    }
}