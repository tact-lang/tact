struct NestedOptional {
    val: Int?;
    flag: Bool?;
}

struct OuterStruct {
    inner: NestedOptional;
    num: Int;
}

contract TestStorage {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: NestedOptional{ val: null, flag: true },
            num: 123,
        };
    }
}
