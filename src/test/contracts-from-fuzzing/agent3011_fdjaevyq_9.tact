struct A {
    x: Int;
    y: Int?;
}

struct B {
    z: A;
    s: String;
}

contract MixNestedOptionals {
    foo: B;
    init() {
        self.foo = B{ z: A{ x: 7, y: null }, s: "sss" };
    }
}