struct InnerMost {
    deep: Int;
}

struct MiddleOpt {
    val: InnerMost?;
}

struct OuterStruct {
    m: MiddleOpt;
}

contract DeepOptional {
    field: OuterStruct;

    init() {
        self.field = OuterStruct{ m: MiddleOpt{ val: null } };
    }
}