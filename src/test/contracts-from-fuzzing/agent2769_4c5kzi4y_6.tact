struct Inner {
    intVal: Int;
    boolVal: Bool;
}

struct Middle {
    inner: Inner;
    maybeInt: Int?;
}

struct Outer {
    mid: Middle;
    str: String;
}

contract NestedComplex {
    complex: Outer;

    init() {
        self.complex = Outer{
            mid: Middle{
                inner: Inner{
                    intVal: 5,
                    boolVal: false,
                },
                maybeInt: null,
            },
            str: "nested",
        };
    }
}