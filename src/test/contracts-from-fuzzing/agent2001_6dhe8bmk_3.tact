struct NestedLevel2 {
    x: Int;
    y: String;
}

struct NestedLevel1 {
    inner: NestedLevel2;
    flag: Bool;
}

contract DeeplyNestedStruct {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            inner: NestedLevel2{
                x: 42,
                y: "Hello",
            },
            flag: true,
        };
    }
}