struct A {
    x: Int;
}

struct B {
    a: A?;
    y: Bool;
}

struct C {
    b: B?;
    z: String;
}

contract TestContract {
    c: C;
    init() {
        self.c = C{
            b: B{
                a: null,
                y: true
            },
            z: "testing"
        };
    }
}