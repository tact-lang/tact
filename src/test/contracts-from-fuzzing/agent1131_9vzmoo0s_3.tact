struct A {
    valA: Int;
}

struct B {
    valB: Int;
    childA: A;
}

struct C {
    valC: Int;
    childB: B;
}

contract Cascade {
    c: C;

    init() {
        self.c = C{
            valC: 3,
            childB: B{
                valB: 2,
                childA: A{ valA: 1 },
            },
        };
    }
}