struct A {
    a: Int;
}

struct B {
    b: Int;
    aStruct: A;
}

struct C {
    c: Bool;
    bStruct: B;
}

contract TestContract {
    cStruct: C;

    init() {
        self.cStruct = C{
            c: true,
            bStruct: B{
                b: 5,
                aStruct: A{
                    a: 3
                }
            }
        };
    }

    receive() {}
}