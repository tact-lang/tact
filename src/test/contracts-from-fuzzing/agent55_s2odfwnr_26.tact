struct SomeStruct {
    x: Int = 1;
    y: Bool = false;
}

contract TopOptNested {
    s: SomeStruct?;
    s2: SomeStruct?;

    init() {
        self.s = null;
        self.s2 = null;
    }
}
