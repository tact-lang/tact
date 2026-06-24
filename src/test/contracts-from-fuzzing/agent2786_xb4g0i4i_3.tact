struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B?;
    w: A?;
}

contract TestOptInStruct {
    optField: C;
    init() {
        self.optField = C{ 
            z: null,
            w: null
        };
    }
}