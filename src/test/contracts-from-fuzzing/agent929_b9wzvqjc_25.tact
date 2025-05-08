struct DeeplyNested {
    s1: String;
    nested: NestedLevel2;
}

struct NestedLevel2 {
    s2: String;
    nested2: NestedLevel3;
}

struct NestedLevel3 {
    s3: String;
}

contract MultiDeepString {
    val: DeeplyNested;
    init() {
        self.val = DeeplyNested{
            s1: "a",
            nested: NestedLevel2{
                s2: "b",
                nested2: NestedLevel3{
                    s3:"c"
                }
            }
        };
    }
}