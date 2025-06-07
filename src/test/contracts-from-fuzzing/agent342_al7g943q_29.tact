struct Sibling1 {
    x: Int;
}

struct Sibling2 {
    y: Int;
}

struct ParentStruct {
    a: Sibling1;
    b: Sibling2;
}

contract SiblingNestedContract {
    f: ParentStruct;

    init() {
        self.f = ParentStruct{
            a: Sibling1{x:1},
            b: Sibling2{y:2}
        };
    }
}
