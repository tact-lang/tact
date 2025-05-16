struct NestedLevel3 {
    z: Int;
}

struct NestedLevel2 {
    nl3: NestedLevel3;
}

struct NestedLevel1 {
    nl2: NestedLevel2;
}

contract DeepNestedStructTest {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            nl2: NestedLevel2{
                nl3: NestedLevel3{z: 123}
            }
        };
    }
}
