struct DeepNested {
    inner: Inner;
}

struct Inner {
    val: Int;
    flag: Bool;
    name: String;
}

contract StorageTest {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: Inner{ val:1, flag:true, name:"ok" }
        };
    }
}