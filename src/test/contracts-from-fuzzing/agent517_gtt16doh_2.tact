struct NestedOptional {
    innerOpt: Int?;
}

struct TopStruct {
    nestedOpt: NestedOptional?;
}

contract OptContract {
    storage: TopStruct;
    init() {
        self.storage = TopStruct{
            nestedOpt: null
        };
    }
}