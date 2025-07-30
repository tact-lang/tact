struct A {
    x: Int;
    b: Bool;
}

struct B {
    y: Int;
    inner: A;
}

struct C {
    z: Int;
    inner: B;
}

contract ManyNestedOptionals {
    maybeStruct: C?;

    init() {
        self.maybeStruct = C{
            z: 10,
            inner: B{
                y: 20,
                inner: A{
                    x: 30,
                    b: true
                }
            }
        };
    }
}