struct NestedOptional {
    innerOpt: Int?;
}

struct Data {
    optStruct: NestedOptional?;
    optInt: Int?;
}

contract Test {
    storage: Data;

    init() {
        self.storage = Data{
            optStruct: null,
            optInt: null
        };
    }
}