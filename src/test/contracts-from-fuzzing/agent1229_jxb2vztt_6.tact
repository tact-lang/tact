struct EndStruct {
    last: Int;
}

struct MidStruct {
    val: Int;
    maybe: EndStruct?;
}

struct StartStruct {
    b: Bool;
    nested: MidStruct;
    flag: Bool;
}

contract OptionalDeepNested {
    complex: StartStruct;

    init() {
        self.complex = StartStruct{
            b: true,
            nested: MidStruct {
                val: 42,
                maybe: null
            },
            flag: false
        };
    }
}
