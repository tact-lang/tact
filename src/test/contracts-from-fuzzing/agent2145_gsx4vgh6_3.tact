struct DeeplyNested {
    first: NestedStruct;
    second: SimpleStruct;
    third: Bool;
}

struct NestedStruct {
    inner: SimpleStruct;
    flag: Bool;
}

struct SimpleStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract StorageTest {
    val: DeeplyNested;

    init() {
        self.val = DeeplyNested{
            first: NestedStruct{
                inner: SimpleStruct{ a: 10, b: false, c: "a" },
                flag: true
            },
            second: SimpleStruct{ a: 11, b: true, c: "b" },
            third: false
        };
    }
}