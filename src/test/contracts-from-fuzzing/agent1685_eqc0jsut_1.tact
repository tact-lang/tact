struct NestedOptional {
    innerOpt: Int?;
}

struct OuterStruct {
    nested: NestedOptional?;
    flag: Bool;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: null,
            flag: true,
        };
    }
}