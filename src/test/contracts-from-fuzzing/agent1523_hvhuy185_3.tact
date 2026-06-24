struct DeeplyNestedLevel3 {
    flag: Bool;
    val: Int;
}

struct DeeplyNestedLevel2 {
    sub3: DeeplyNestedLevel3;
    opt3: DeeplyNestedLevel3?;
}

struct DeeplyNestedLevel1 {
    sub2: DeeplyNestedLevel2;
    opt2: DeeplyNestedLevel2?;
}

contract TestContract {
    nested: DeeplyNestedLevel1;

    init() {
        self.nested = DeeplyNestedLevel1{
            sub2: DeeplyNestedLevel2{
                sub3: DeeplyNestedLevel3{ flag: true, val: 7 },
                opt3: null
            },
            opt2: null
        };
    }
}