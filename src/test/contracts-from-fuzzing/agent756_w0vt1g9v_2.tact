struct NestedLevel3 {
    f1: Int;
    f2: Bool?;
    f3: String;
}

struct NestedLevel2 {
    inner: NestedLevel3;
    optInner: NestedLevel3?;
}

struct NestedLevel1 {
    inner: NestedLevel2;
    optInner: NestedLevel2?;
}

contract DeepNestedContract {
    deep: NestedLevel1;
    init() {
        self.deep = NestedLevel1{
            inner: NestedLevel2{
                inner: NestedLevel3{
                    f1: 1,
                    f2: true,
                    f3: "test",
                },
                optInner: null,
            },
            optInner: null,
        };
    }
}