struct OptionalSlice {
    val: Slice?;
}

contract OptSliceStore {
    foo: OptionalSlice;

    init() {
        self.foo = OptionalSlice{
            val: null
        };
    }
}