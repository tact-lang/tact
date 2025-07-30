struct SomeStruct {
    foo: Int?;
}

contract DefaultedOpt {
    s1: SomeStruct;
    s2: SomeStruct;

    init() {
        self.s1 = SomeStruct{foo: null};
        self.s2 = SomeStruct{foo: 123};
    }
}