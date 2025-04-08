// Test contract with a struct with nested optionals inside optionals
struct InnerMost {
    val: Int?;
}

struct OuterStruct {
    innerOpt: InnerMost?;
}

contract OptInOpt {
    field: OuterStruct;

    init() {
        self.field = OuterStruct{ innerOpt: null };
    }
}