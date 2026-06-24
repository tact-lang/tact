struct NestedOptional {
    inner: OptStruct?;
    flag: Bool;
}

struct OptStruct {
    x: Int?;
    y: String?;
}

contract StorageTest {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            inner: null,
            flag: true
        };
    }
}