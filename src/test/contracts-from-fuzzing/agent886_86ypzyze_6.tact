struct A {
    val: Int;
}

struct B {
    x: A;
    y: Int;
}

struct C {
    first: A;
    second: B;
    maybe: B?;
}

contract TestContract {
    nestedVal: C;

    init() {
        self.nestedVal = C{
            first: A{val: 1},
            second: B{x: A{val: 2}, y:3},
            maybe: null
        };
    }
}