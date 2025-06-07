struct NestedLevel3 {
    val: Int;
    flag: Bool;
}

struct NestedLevel2 {
    inner: NestedLevel3;
    text: String;
}

struct NestedLevel1 {
    deep: NestedLevel2;
    optInt: Int?;
}

contract DeeplyNested {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            deep: NestedLevel2{
                inner: NestedLevel3{val: 5, flag: true},
                text: "deep",
            },
            optInt: null,
        };
    }
}
