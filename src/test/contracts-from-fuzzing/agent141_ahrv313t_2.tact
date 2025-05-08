struct InnerOptional {
    val: Int?;
}

contract NestedOptionalStruct {
    data: InnerOptional;

    init() {
        self.data = InnerOptional{ val: null };
    }
}