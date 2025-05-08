struct A {
    fa: Int;
}
struct B {
    fb: Int;
}
struct C {
    fc: Int;
}
struct D {
    fd: Int;
}

contract ManyStructFields {
    sa: A = A{fa: 1};
    sb: B = B{fb: 2};
    sc: C = C{fc: 3};
    sd: D = D{fd: 4};
}