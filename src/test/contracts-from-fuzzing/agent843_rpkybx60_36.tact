struct S {
    nested: Int?;
}

contract NullableStructWithInt {
    s: S?;

    init() {
        self.s = S{ nested: null };
    }
}
