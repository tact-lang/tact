struct InnerOptStruct {
    ai: Int?;
    bi: Int = 1;
}

contract NestedOptionals {
    data: InnerOptStruct?;
    init() {
        self.data = null;
    }
}
