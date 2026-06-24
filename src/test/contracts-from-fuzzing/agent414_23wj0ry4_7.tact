struct Sub { a: Int; b: Int }

contract ReassignedNested {
    nested: Sub;

    init() {
        self.nested = Sub{ a: 0, b: 0 };
        self.nested = Sub{ a: -999, b: 999 };
    }
}