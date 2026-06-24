struct NestedStruct {
    inner: Int;
    flag: Bool;
}

struct OuterStruct {
    count: Int;
    nested: NestedStruct;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            count: 5,
            nested: NestedStruct{ inner: 1, flag: true }
        };
    }
}