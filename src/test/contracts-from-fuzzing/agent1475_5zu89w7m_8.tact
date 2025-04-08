struct A {
    val: Int;
}

struct B {
    a: A;
    flag: Bool;
}

struct C {
    b: B;
    txt: String;
}

contract CBigger {
    storage: C;

    init() {
        self.storage = C{
            b: B{
                a: A{ val: 777 },
                flag: true,
            },
            txt: "c-struct",
        };
    }
}