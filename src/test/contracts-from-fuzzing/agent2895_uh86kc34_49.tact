struct NestOptionalSlice {
    s: Slice?;
}

contract ContainsNestedOptionalSlice {
    val: NestOptionalSlice;

    init() {
        self.val = NestOptionalSlice{ s: null };
    }
}
