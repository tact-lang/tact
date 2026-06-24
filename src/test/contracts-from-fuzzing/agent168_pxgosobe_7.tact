struct NestedLevel3 {
    z: Int;
}

struct NestedLevel2 {
    y: NestedLevel3;
}

struct NestedLevel1 {
    x: NestedLevel2;
}

contract TestDeepNesting {
    val: NestedLevel1;

    init() {
        self.val = NestedLevel1{
            x: NestedLevel2{
                y: NestedLevel3{z: 42}
            }
        };
    }
}