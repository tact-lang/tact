struct InnerStruct {
    flag: Bool;
    count: Int;
    nestedOpt: Int?;
}

struct OuterStruct {
    inner: InnerStruct;
    val: Int;
    innerOpt: InnerStruct?;
}

contract StorageTest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: InnerStruct{ flag: true, count: 10, nestedOpt: null },
            val: 20,
            innerOpt: null
        };
    }
}
