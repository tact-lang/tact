struct NestedOptional {
    innerVal: Int?;
}

struct OuterStruct {
    info: NestedOptional?;
    flag: Bool;
}

contract OptInOpt {
    state: OuterStruct;

    init() {
        self.state = OuterStruct{
            info: null,
            flag: true,
        };
    }
}