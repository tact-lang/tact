struct A {
    val: Int;
}

struct B {
    val: Int;
}

struct C {
    a: A;
    b: B;
    str: String;
}

contract NestedMultiStruct {
    data: C;
    init() {
        self.data = C{
            a: A{ val: 11 },
            b: B{ val: 22 },
            str: "hello",
        };
    }
}
