struct A {
    foo: Int;
    bar: Bool;
}

struct B {
    nested: A;
    str: String;
}

struct C {
    deep: B;
    val: Int;
}

contract MultiNest {
    s: C;

    init() {
        self.s = C{
            deep: B{
                nested: A{ foo: 1, bar: false },
                str: "ok"
            },
            val: 99
        };
    }
}