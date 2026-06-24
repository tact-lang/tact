struct A { val: Int }
struct B { val: Int }
struct C { val: Int }
struct Container {
    a: A;
    b: B;
    c: C;
}

contract TestContract {
    storage: Container;

    init() {
        self.storage = Container{
            a: A{ val: 1 },
            b: B{ val: 2 },
            c: C{ val: 3 }
        };
    }
}