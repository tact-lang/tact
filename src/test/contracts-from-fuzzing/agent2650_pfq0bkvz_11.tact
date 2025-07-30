struct NestedStruct {
    a: Int;
    b: Inner;
}

struct Inner {
    c: Int;
    d: InnerMost;
}

struct InnerMost {
    e: Int;
    f: Bool;
}

contract StorageTest {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            a:1,
            b: Inner{
                c:2,
                d: InnerMost{ e:3, f:true }
            }
        };
    }
}