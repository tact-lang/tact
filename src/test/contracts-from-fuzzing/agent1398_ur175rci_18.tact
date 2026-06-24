struct S1 {
    x: Int;
}

struct S2 {
    y: String;
}

struct ContainerStruct {
    inner1: S1;
    inner2: S2;
    optionalInner1: S1?;
    optionalInner2: S2?;
    intVal: Int;
}

contract MixedNestedOptionals {
    data: ContainerStruct;

    init() {
        self.data = ContainerStruct{
            inner1: S1{ x: 7 },
            inner2: S2{ y: "hai" },
            optionalInner1: null,
            optionalInner2: null,
            intVal: 11
        };
    }
}