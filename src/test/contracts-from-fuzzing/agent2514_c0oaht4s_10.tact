struct WrapOptStruct {
    nestedOpt: NestedWithOpt;
}

struct NestedWithOpt {
    f1: Int;
    f2: Bool?;
    f3: InnerStruct?;
}

struct InnerStruct {
    s: String;
}

contract OptsInNested {
    data: WrapOptStruct;

    init() {
        self.data = WrapOptStruct{
            nestedOpt: NestedWithOpt{
                f1: 1,
                f2: null,
                f3: null,
            }
        };
    }
}