struct A {
    a: Int?;
}

struct B {
    b: A?;
}

struct C {
    c: B?;
}

contract ManyOptChain {
    top: C;
    init() {
        self.top = C { c: null };
    }
}