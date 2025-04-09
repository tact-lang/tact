struct IntNested {
    one: Int;
    two: Int;
    three: Int;
    four: Int;
}

contract LargeNestedStruct {
    st: IntNested;

    init() {
        self.st = IntNested{ one:1, two:2, three:3, four:4 };
    }
}