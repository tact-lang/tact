struct DeepOptionStruct {
    inner: Inner?;
}

struct Inner {
    value: Int?;
}

contract NestedNulls {
    s: DeepOptionStruct;

    init() {
        self.s = DeepOptionStruct{
            inner: null
        };
    }
}