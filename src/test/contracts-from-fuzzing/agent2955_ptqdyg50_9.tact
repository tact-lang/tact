struct A {
    val: Int;
}

struct B {
    val: Bool;
}

struct C {
    a: A;
    b: B;
    message: String;
}

contract MixedNested {
    data: C;

    init() {
        self.data = C{
            a: A{ val: -1 },
            b: B{ val: false },
            message: "yo"
        };
    }
}
