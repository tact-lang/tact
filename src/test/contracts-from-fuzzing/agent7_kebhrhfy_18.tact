struct A {
    x: Int?;
}

struct B {
    y: Int?;
}

contract MultipleStructOptionals {
    s1: A?;
    s2: B?;
    init() {
        self.s1 = null;
        self.s2 = null;
    }
}