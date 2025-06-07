struct C {
    val: Int = 50;
}

struct B {
    c: C? = null;
}

struct A {
    b: B? = null;
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