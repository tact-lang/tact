struct A {
    sub: B?;
}
struct B {
    sub: C?;
}
struct C {
    sub: D?;
}
struct D {
    sub: E?;
}
struct E {
    num: Int?;
}

contract Test {
    val: A?;
    init() {
        self.val = null;
    }
}