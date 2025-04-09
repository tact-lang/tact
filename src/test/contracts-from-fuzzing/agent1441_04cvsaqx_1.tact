struct InnerStruct {
    val1: Int;
    val2: Bool;
}

struct OuterStruct {
    inner: InnerStruct;
    flag: Bool;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: InnerStruct{
                val1: 42,
                val2: true,
            },
            flag: false,
        };
    }
}