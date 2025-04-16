struct NestedLevel2 {
    val: Int = 5;
    flag: Bool = true;
}

struct NestedLevel1 {
    nested2: NestedLevel2;
    text: String = "hello";
}

struct RootStruct {
    nested1: NestedLevel1;
    optNested1: NestedLevel1?;
    count: Int = 9;
}

contract TestContract {
    complex: RootStruct;
    init() {
        self.complex = RootStruct{
            nested1: NestedLevel1{
                nested2: NestedLevel2{val: 100, flag: false},
                text: "abc"
            },
            optNested1: null,
            count: 77,
        };
    }
}
