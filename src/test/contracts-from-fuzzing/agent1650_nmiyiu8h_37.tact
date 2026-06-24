struct NestedLevel3 {
    i: Int;
}

struct NestedLevel2 {
    c: NestedLevel3;
}

struct NestedLevel1 {
    b: NestedLevel2;
}

struct OuterWrap {
    inner: NestedLevel1;
    extra: String;
}

contract DeepStrStruct {
    data: OuterWrap;

    init() {
        self.data = OuterWrap{
            inner: NestedLevel1{
                b: NestedLevel2{
                    c: NestedLevel3{
                        i: 55,
                    },
                },
            },
            extra: "extra",
        };
    }
}