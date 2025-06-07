struct A {
    x: Int;
    y: Bool;
}

struct B {
    a: A;
    z: String;
}

contract NestedStructMix {
    b: B;
    init() {
        self.b = B{
            a: A{ x:11, y:true },
            z: "yo"
        };
    }
}