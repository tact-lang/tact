struct SomeStruct {
    x: Int;
}

contract OptStructList {
    a: SomeStruct?;
    b: SomeStruct?;
    c: SomeStruct?;
    d: SomeStruct?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}
