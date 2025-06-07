// deeply nested optionals in structs
struct B {
    a: Int?;
}

struct A {
    b: B?;
}

contract TestContract {
    x: A?;

    init() {
        self.x = null;
    }
}
