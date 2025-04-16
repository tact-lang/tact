struct A {
    b: B;
}

struct B {
    x: Int;
    c: C;
}

struct C {
    y: Int;
    opt: Bool?;
}

contract TestContract {
    val: A;

    init() {
        self.val = A{
            b: B{
                x: 5,
                c: C{y:7,opt:null}
            }
        };
    }
}