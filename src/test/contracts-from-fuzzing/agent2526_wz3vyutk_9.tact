struct A {
    x: Int;
}

struct B {
    y: Bool;
    a: A?;
}

struct C {
    flag: Bool;
    b: B;
}

contract TestStorage {
    c: C = C{ flag: true, b: B{ y: false, a: null } };
}