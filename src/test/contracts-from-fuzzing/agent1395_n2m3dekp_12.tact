struct OptStruct {
    foo: Int = 1;
    bar: Int?;
}

contract StructWithPartialDefaults {
    val: OptStruct;

    init() {
        self.val = OptStruct{
            bar: null
        };
    }
}