struct NestedStruct {
    inner: Inner;
}

struct Inner {
    flag: Bool;
}

contract StructOrderTest {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: Inner{flag:true},
        };
    }
}