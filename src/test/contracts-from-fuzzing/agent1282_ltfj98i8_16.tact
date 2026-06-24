// Contract with nested optional struct inside optional
struct InnerStruct {
    num: Int;
    flag: Bool?;
}

contract NestedOptStruct {
    optNested: InnerStruct?;

    init() {
        self.optNested = null;
    }
}