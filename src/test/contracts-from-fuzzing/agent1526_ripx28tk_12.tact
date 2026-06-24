struct SiblingOne {
    a: Int;
}

struct SiblingTwo {
    b: Bool;
}

struct ParentStruct {
    s1: SiblingOne;
    s2: SiblingTwo;
}

contract MultipleSiblingsContract {
    parent: ParentStruct;

    init() {
        self.parent = ParentStruct{
            s1: SiblingOne{a:1},
            s2: SiblingTwo{b:true},
        };
    }
}