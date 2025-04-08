struct NestedOptional {
    flag: Bool?;
    count: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    data: Int;
    message: String?;
}

contract TestContract {
    optStruct: NestedOptional;
    init() {
        self.optStruct = NestedOptional{
            flag: null,
            count: null,
            inner: null,
        };
    }
}