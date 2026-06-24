struct A {
    a: Int;
}

struct B {
    b: Int;
    a_struct: A;
}

struct C {
    c1: C1;
}

struct C1 {
    c2: C2;
}

struct C2 {
    c3: C3;
}

struct C3 {
    c4: Int;
}

contract TestContract {
    field1: A;
    field2: B;
    field3: C;
    init() {
        self.field1 = A{a:1};
        self.field2 = B{b:2, a_struct:A{a:3}};
        self.field3 = C{c1:C1{c2:C2{c3:C3{c4:4}}}};
    }
}
