struct Nested {
    inner: InnerStruct;
    flag: Bool;
}

struct InnerStruct {
    val: Int;
    maybe: Bool?;
}

contract DeepTest {
    persist: Nested;

    init() {
        self.persist = Nested{
            inner: InnerStruct{ val: 10, maybe: true },
            flag: false
        };
    }
}