struct Outer {
    intVal: Int;
    nested: Inner;
}

struct Inner {
    boolVal: Bool;
    strVal: String;
}

contract OrderCheck {
    a: Outer;

    init() {
        self.a = Outer{
            intVal: 5,
            nested: Inner{
                boolVal: true,
                strVal: "yo",
            }
        };
    }
}