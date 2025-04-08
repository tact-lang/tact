struct NestedLevel2 {
    innermostVal: Int;
}

struct NestedLevel1 {
    nested2: NestedLevel2;
}

contract DeeplyNestedStructContract {
    level1: NestedLevel1;

    init() {
        self.level1 = NestedLevel1{
            nested2: NestedLevel2{ innermostVal: 123 }
        };
    }
}