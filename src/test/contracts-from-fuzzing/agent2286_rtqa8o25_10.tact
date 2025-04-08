struct A {
    x: Int;
}

struct B {
    y: Int;
    child: A;
}

struct C {
    z: Int;
    child: B;
}

contract Chain {
    val: C = C{
        z: 1,
        child: B{
            y:2,
            child: A{x:3}
        }
    };

    init() {
        self.val = C{
            z: 10,
            child: B{
                y: 20,
                child: A{x:30}
            }
        };
    }
}