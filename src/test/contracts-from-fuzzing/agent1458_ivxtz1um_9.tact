struct InnerA {
    a: Int;
}

struct InnerB {
    b: String;
}

struct ParentStruct {
    p1: InnerA;
    p2: InnerB;
}

contract MultipleNestedStructs {
    data: ParentStruct;

    init() {
        self.data = ParentStruct{
            p1: InnerA{ a: 10 },
            p2: InnerB{ b: "hi" }
        };
    }
}