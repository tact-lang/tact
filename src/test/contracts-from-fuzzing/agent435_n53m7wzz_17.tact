struct NestedOptStruct {
    foo: Int?;
    bar: Bool?;
}

contract PersistentNestedOptionals {
    s1: NestedOptStruct?;
    s2: NestedOptStruct?;

    init() {
        self.s1 = null;
        self.s2 = NestedOptStruct{ foo: null, bar: null };
    }
}