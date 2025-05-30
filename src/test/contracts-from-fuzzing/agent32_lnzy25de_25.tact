struct D {
    val: Int;
}

struct C {
    child: D;
}

struct B {
    child: C;
}

struct A {
    child: B;
}

contract TestContract {
    root: A;

    init() {
        self.root = A{
            child: B{
                child: C{
                    child: D{
                        val: 777,
                    },
                },
            },
        };
    }
}