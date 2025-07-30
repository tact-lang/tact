struct NestedOptionalStruct {
    innerOpt: Int?;
    anotherOpt: Bool?;
}

struct OuterOptStruct {
    nestedOpt: NestedOptionalStruct?;
    s: String;
}

contract TestOptionalNestedStruct {
    data: OuterOptStruct;

    init() {
        self.data = OuterOptStruct{
            nestedOpt: null,
            s: "abc"
        };
    }
}