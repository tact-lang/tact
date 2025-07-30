struct SubStruct {
    val: Int = 1;
    flag: Bool = true;
    note: String = "hi";
}

struct ParentStruct {
    s1: SubStruct;
    s2: SubStruct;
    num: Int?;
}

contract MultiNestedTest {
    store: ParentStruct;

    init() {
        self.store = ParentStruct{
            s1: SubStruct{ val: 11, flag: false, note: "A" },
            s2: SubStruct{ val: 22, flag: true, note: "B" },
            num: 99
        };
    }
}