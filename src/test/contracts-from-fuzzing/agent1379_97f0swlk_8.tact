struct A {
    s: Slice;
    c: Cell;
    a: Address;
}

struct B {
    a1: A;
    a2: A;
}

struct C {
    b1: B;
    b2: B;
}

contract FieldNest {
    deep: C;

    init() {
        self.deep = C{
            b1: B{
                a1: A{ s: emptyCell().asSlice(), c: emptyCell(), a: myAddress() },
                a2: A{ s: emptyCell().asSlice(), c: emptyCell(), a: myAddress() }
            },
            b2: B{
                a1: A{ s: emptyCell().asSlice(), c: emptyCell(), a: myAddress() },
                a2: A{ s: emptyCell().asSlice(), c: emptyCell(), a: myAddress() }
            }
        };
    }
}
