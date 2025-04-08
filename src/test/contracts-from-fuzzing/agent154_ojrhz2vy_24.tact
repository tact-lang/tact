struct B {
    y: Int;
}

struct A {
    b: B;
}

struct Holder1 {
    a: A;
    flag: Bool;
}

struct Holder2 {
    h: Holder1;
    s: String;
}

contract NestedStructsPersist {
    x: Holder2;

    init() {
        self.x = Holder2{
            h: Holder1{
                a: A{ b: B{ y:1 } },
                flag: true
            },
            s: "hi"
        };
    }
}