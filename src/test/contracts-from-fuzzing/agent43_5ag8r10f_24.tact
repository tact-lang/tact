struct OptOptStruct {
    a: Int?;
    b: Bool?;
}

contract DoubleOptionals {
    a: OptOptStruct?;
    b: OptOptStruct?;

    init() {
        self.a = null;
        self.b = OptOptStruct{ a: 3, b: null };
    }
}