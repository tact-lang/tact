struct Container {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    i: Int;
    s: String;
}

contract BulkNestedStruct {
    data: Container;

    init() {
        self.data = Container{
            inner1: Inner{ i:1,s:"a" },
            inner2: Inner{ i:2,s:"b" }
        };
    }
}