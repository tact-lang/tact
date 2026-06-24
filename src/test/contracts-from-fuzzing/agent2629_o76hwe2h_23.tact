struct Deeply {
    lvl1: A;
}

struct A {
    lvl2: B;
}

struct B {
    lvl3: C;
}

struct C {
    some: Int;
}

contract Multilevel {
    field: Deeply = Deeply{
        lvl1: A{
            lvl2: B{
                lvl3: C{
                    some: 99
                }
            }
        }
    };

    init() {}
}