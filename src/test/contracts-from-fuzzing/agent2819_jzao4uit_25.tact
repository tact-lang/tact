// optional of nested struct
struct A {
    x: Int;
}

struct B {
    a: A;
    y: Int;
}

contract TestContract {
    val: B?;

    init() {
        self.val = B{
            a: A{x: 7},
            y: 8
        };
    }
}