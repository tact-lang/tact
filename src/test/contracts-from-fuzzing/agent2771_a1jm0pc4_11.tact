struct SubInner {
    s: String;
    value: Int;
}

struct Inner {
    intVal: Int;
    optionalSub: SubInner?;
}

contract NestedOptionalInsideStruct {
    nested: Inner;

    init() {
        self.nested = Inner{
            intVal: 99,
            optionalSub: null
        };
    }
}