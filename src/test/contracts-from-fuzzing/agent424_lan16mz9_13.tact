struct A {
    x: Int;
    y: String;
}

struct B {
    a: A;
    b: A;
}

struct C {
    b: B;
    z: Bool;
}

contract StructLayerCake {
    layered: C;

    init() {
        self.layered = C{
            b: B{
                a: A{x:5,y:"one"},
                b: A{x:7,y:"two"}
            },
            z: false
        };
    }
}