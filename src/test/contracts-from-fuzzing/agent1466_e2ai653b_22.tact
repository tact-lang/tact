struct ContainsOptionalStruct {
    inner: Inner?;
    count: Int;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract OptStructTest {
    data: ContainsOptionalStruct = ContainsOptionalStruct{ inner: null, count: 0 };

    init() {
        self.data = ContainsOptionalStruct{
            inner: Inner{ val: 42, flag: true },
            count: 1
        };
    }
}
