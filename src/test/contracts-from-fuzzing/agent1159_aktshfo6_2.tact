struct NestedLevel2 {
    i: Int;
    b: Bool;
}

struct NestedLevel1 {
    nl2: NestedLevel2;
    optNl2: NestedLevel2?;
    flag: Bool;
}

struct RootStruct {
    fieldInt: Int;
    optNl1: NestedLevel1?;
    nl1: NestedLevel1;
}

contract TestContract {
    root: RootStruct;

    init() {
        self.root = RootStruct{
            fieldInt: 1,
            optNl1: null,
            nl1: NestedLevel1{
                nl2: NestedLevel2{i: 2, b: false},
                optNl2: null,
                flag: true
            }
        };
    }
}