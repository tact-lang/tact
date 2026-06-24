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
    val: NestedStruct;

    init() {
        self.val = NestedStruct{
            inner: SimpleStruct{ a: 1, b: true, c: "hi" },
            flag: true,
        };
    }
}