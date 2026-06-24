struct InnerStruct {
    a: Int = 1;
    b: Bool = true;
    s: String = "hello";
}

struct OuterStruct {
    inner: InnerStruct;
    flag: Bool = false;
    num: Int = 42;
}

contract DeepNestedContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: InnerStruct{ a: 9, b: false, s: "world" },
            flag: true,
            num: 100,
        };
    }
}