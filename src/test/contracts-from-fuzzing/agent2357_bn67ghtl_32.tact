struct NestedOptional {
    a: Int;
    b: Int?;
}

contract OuterOptional {
    o: NestedOptional?;

    init() {
        self.o = null;
    }
}
