struct SomeStruct {
    foo: Int = 10;
}

contract ManyStructFields {
    a: SomeStruct;
    b: SomeStruct;
    c: SomeStruct;
    d: SomeStruct;
    e: SomeStruct;
    f: SomeStruct;
    g: SomeStruct;

    init() {
        self.a = SomeStruct{};
        self.b = SomeStruct{};
        self.c = SomeStruct{};
        self.d = SomeStruct{};
        self.e = SomeStruct{};
        self.f = SomeStruct{};
        self.g = SomeStruct{};
    }
}