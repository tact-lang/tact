struct NullableSliceStruct {
    foo: Slice?;
    bar: Int;
}

contract OptionSlice {
    data: NullableSliceStruct;

    init() {
        self.data = NullableSliceStruct{
            foo: null,
            bar: 1
        };
    }
}