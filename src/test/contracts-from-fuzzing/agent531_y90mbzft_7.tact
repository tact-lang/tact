struct NestedOptional {
    inner: Int?;
    flag: Bool;
}

struct ParentStruct {
    nested: NestedOptional;
    count: Int;
}

contract OptionStructs {
    myData: ParentStruct;

    init() {
        self.myData = ParentStruct{
            nested: NestedOptional{
                inner: null,
                flag: true
            },
            count: 77
        };
    }
}