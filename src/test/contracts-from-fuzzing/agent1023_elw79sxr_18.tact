struct SomeStruct {
    x: Int;
    y: Int;
}

contract MultiVarsContract {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = null;
    e: SomeStruct;

    init() {
        self.e = SomeStruct{ x: 10, y: 20 };
    }
}