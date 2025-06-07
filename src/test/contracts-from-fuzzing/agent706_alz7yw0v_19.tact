struct OptionalSliceStruct {
    a: Int;
    s: Slice?;
}

contract TestContract {
    val: OptionalSliceStruct;

    init() {
        self.val = OptionalSliceStruct{
            a: 1,
            s: null,
        };
    }
}