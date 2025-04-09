struct A {
    x: Int;
    y: Bool;
}

struct B {
    inner: A;
    note: String;
}

struct C {
    middle: B;
    flag: Bool;
}

struct D {
    unit: C;
    text: String?;
}

contract WideDeepStruct {
    blob: D;

    init() {
        self.blob = D{
            unit: C{
                middle: B{
                    inner: A{x: -1, y: false},
                    note: "hi"
                },
                flag: true
            },
            text: null
        };
    }
}
