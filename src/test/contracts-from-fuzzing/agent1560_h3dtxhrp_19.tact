struct A {
    f1: Int;
    f2: Bool;
}

struct B {
    f3: A;
    f4: Int;
}

struct C {
    f5: B;
    f6: Bool;
}

contract TestContract {
    val: C = C{f5: B{f3: A{f1: 1, f2: false}, f4: 2}, f6: true};
}