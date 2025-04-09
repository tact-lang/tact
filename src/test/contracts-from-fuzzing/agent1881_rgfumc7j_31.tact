struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct Group {
    a: A;
    b: B;
    c: C;
}

contract NestedGroups {
    field: Group;

    init() {
        self.field = Group{
            a: A{x:1},
            b: B{y:2},
            c: C{z:3}
        };
    }
}