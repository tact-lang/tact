struct NestedOptional {
    optStruct: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    comment: String?;
}

contract NestedOptContract {
    no: NestedOptional;

    init() {
        self.no = NestedOptional{ optStruct: null };
    }
}