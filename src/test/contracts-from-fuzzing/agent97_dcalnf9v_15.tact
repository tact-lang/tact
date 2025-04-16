struct NestedStruct {
    x: Int;
}

contract InlineInitNested {
    val: NestedStruct;
    init() {
        self.val = NestedStruct{x:123};
    }
}