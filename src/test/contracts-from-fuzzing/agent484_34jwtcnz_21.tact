struct A {
    s: String;
    b: Bool;
}

struct B {
    val: Int;
    sub: A?;
}

contract OptionalInMiddle {
    x: B;

    init() {
        self.x = B {
            val: 7,
            sub: A { s: "ok", b: false }
        };
    }
}