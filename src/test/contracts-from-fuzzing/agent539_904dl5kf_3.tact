struct Inner {
    s: String;
    b: Bool;
}

struct Outer {
    intVal: Int;
    inr: Inner;
    optStr: String?;
}

contract TestContract {
    complex: Outer;
    init() {
        self.complex = Outer{
            intVal: 20,
            inr: Inner{
                s: "test",
                b: true,
            },
            optStr: null,
        };
    }
}