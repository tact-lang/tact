struct NestedLevel3 {
    deepVal: Int;
}

struct NestedLevel2 {
    nested3: NestedLevel3;
    flag2: Bool;
}

struct NestedLevel1 {
    nested2: NestedLevel2;
    flag1: Bool;
}

contract DeepNested {
    state: NestedLevel1;

    init() {
        self.state = NestedLevel1{
            nested2: NestedLevel2{
                nested3: NestedLevel3{deepVal: 10},
                flag2: false
            },
            flag1: true
        };
    }
}