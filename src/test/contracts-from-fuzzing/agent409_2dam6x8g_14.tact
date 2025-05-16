struct A {
    val: Int;
}

struct B {
    val: Int;
}

contract Test {
    ai: A?;
    bi: B?;
    x: Int;

    init() {
        self.ai = null;
        self.bi = null;
        self.x = 5;
    }
}