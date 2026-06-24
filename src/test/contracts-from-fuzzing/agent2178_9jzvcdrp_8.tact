struct A {
    x: Int;
    b: Bool;
}

struct B {
    y: Int?;
    a: A;
}

struct C {
    foo: String;
    bar: B?;
}

struct D {
    baz: C;
    switcher: Bool;
}

contract ComboDeep {
    data: D;

    init() {
        self.data = D{
            baz: C{
                foo: "hi",
                bar: null
            },
            switcher: false
        };
    }
}