struct InnerOpt {
    val: Int?;
    flag: Bool?;
}

contract NestedOptionalStruct {
    data: InnerOpt?;

    init() {
        self.data = null;
    }
}