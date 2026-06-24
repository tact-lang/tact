struct DeepNested {
    inner: InnerStruct;
    flag: Bool;
}

struct InnerStruct {
    foo: Int;
    bar: String;
}

contract TestContract {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            inner: InnerStruct{foo: 1, bar: "str"},
            flag: true
        };
    }
}