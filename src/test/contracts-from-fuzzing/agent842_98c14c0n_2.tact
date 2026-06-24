struct NestedLevel2 {
    a: Int?;
    b: Bool;
}

struct NestedLevel1 {
    inner: NestedLevel2;
    flag: Bool?;
}

contract DeepNested {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            inner: NestedLevel2{ a: null, b: false },
            flag: null
        };
    }
}