struct A {
    f: Bool;
}

struct B {
    a: A;
    str: String;
}

struct C {
    optB: B?;
}

contract ComplexOptions {
    val: C;

    init() {
        self.val = C{
            optB: null
        };
    }
}
