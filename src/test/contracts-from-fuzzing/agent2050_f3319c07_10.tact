struct OptInStruct {
    foo: Int?;
    bar: Bool?;
}

contract StructOptDefaults {
    val: OptInStruct = OptInStruct{ foo: null, bar: null };

    init() {
        self.val = OptInStruct{ foo: null, bar: null };
    }
}