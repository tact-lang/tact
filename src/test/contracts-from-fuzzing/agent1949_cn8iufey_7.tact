struct A {
    v1: Int;
    v2: Bool;
}

struct B {
    v3: String;
    v4: Address;
}

struct C {
    a: A;
    b: B;
    aopt: A?;
    bopt: B?;
}

contract NestedOptStructs {
    c: C;

    init() {
        self.c = C{
            a: A{v1: 1, v2: true},
            b: B{v3: "hi", v4: myAddress()},
            aopt: null,
            bopt: null
        };
    }
}
