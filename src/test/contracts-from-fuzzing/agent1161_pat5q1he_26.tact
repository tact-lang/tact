struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct OuterStruct {
    nested: NestedDefaults;
}

contract DefaultsInDeepStruct {
    val: OuterStruct;

    init() {
        self.val = OuterStruct{ nested: NestedDefaults{} };
    }
}