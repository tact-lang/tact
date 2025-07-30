// optional struct with nested optional
struct A {
    a: Int?;
}

struct B {
    a: A?;
}

contract Test {
    b: B?;

    init() {
        self.b = null;
    }
}