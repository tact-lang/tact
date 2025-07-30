struct A {i: Int}
struct B {j: Int}
struct C {k: Int}

struct D {
    a: A;
    b: B;
    c: C;
}

contract TestContract {
    d: D;
    init() {
        self.d = D{a:A{i:1},b:B{j:2},c:C{k:3}};
    }
}