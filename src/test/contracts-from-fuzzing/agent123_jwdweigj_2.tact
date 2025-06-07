struct NestedLevel3 {
    deepVal: Int;
}

struct NestedLevel2 {
    inner: NestedLevel3;
    flag: Bool;
}

struct NestedLevel1 {
    content: NestedLevel2;
}

contract DeepStruct {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            content: NestedLevel2{
                inner: NestedLevel3{deepVal: 123},
                flag: true
            }
        };
    }
}