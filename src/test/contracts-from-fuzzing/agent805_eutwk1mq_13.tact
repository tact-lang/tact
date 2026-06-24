struct C {
    val: Int;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract TestContract {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: null
            }
        };
    }
}