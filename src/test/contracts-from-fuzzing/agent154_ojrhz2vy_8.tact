struct NestedOptionals {
    innerOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
}

struct OuterOptionalHolder {
    nestedOpt: NestedOptionals?;
}

contract OptionalLayering {
    field: OuterOptionalHolder;

    init() {
        self.field = OuterOptionalHolder{ nestedOpt: null };
    }
}