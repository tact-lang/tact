struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct C {
    z: Int;
}

contract ManyDifferentStructs {
    first: A;
    second: B;
    third: C;

    init() {
        self.first = A{x: 1};
        self.second = B{y: 2};
        self.third = C{z: 3};
    }
}