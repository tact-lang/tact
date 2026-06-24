struct NestedLevel3 {
    val1: Int;
    val2: Bool;
}

struct NestedLevel2 {
    dep1: NestedLevel3;
    dep2: Bool;
}

struct NestedLevel1 {
    dep0: NestedLevel2;
    flag: Bool;
}

contract ManyNested {
    superfield: NestedLevel1;
    init() {
        self.superfield = NestedLevel1{
            dep0: NestedLevel2 {
                dep1: NestedLevel3 { val1: 5, val2: false },
                dep2: true
            },
            flag: true
        };
    }
}