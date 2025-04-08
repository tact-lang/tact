struct OptionalNested {
    innerOpt: Bool?;
}

struct OuterOptStruct {
    nestedOpt: OptionalNested?;
    val: Int?;
}

contract NestedOptContract {
    data: OuterOptStruct;

    init() {
        self.data = OuterOptStruct{ nestedOpt: null, val: null };
    }
}