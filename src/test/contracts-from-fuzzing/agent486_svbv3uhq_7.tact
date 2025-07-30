struct OptInStruct {
    innerVal: Int?;
}

struct OuterStruct {
    val1: Int = 1;
    nested: OptInStruct;
    val2: Bool = false;
}

contract OptInContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            val1: 42,
            nested: OptInStruct{ innerVal: null },
            val2: true,
        };
    }
}