struct DeepNested {
    inner: Inner;
    anotherInt: Int;
}

struct Inner {
    boolOpt: Bool?;
    str: String;
    intVal: Int;
}

contract TestContract {
    complex: DeepNested;

    init() {
        self.complex = DeepNested{
            inner: Inner{
                boolOpt: null,
                str: "hi",
                intVal: 12,
            },
            anotherInt: 99,
        };
    }

    receive() {}
}