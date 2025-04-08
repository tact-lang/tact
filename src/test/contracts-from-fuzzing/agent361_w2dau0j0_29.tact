struct SingleField {
    x: Int;
}

contract JustAssignStruct {
    s: SingleField;
    init() {
        self.s = SingleField{ x:99 };
    }
}
