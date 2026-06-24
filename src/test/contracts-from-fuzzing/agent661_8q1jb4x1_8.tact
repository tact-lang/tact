struct B {
    y: Int;
}

struct A {
    x: Int;
    b: B;
}

contract TestContract {
    val: A;

    init() {
        self.val = A{
            x: 5,
            b: B{
                y: 10
            }
        };
    }
}