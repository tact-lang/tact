struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract TestContract {
    deep: DeepNested = DeepNested{inner: InnerStruct{val: 12, flag: false}};

    init() {
        self.deep = DeepNested{inner: InnerStruct{val: 12, flag: false}};
    }

    receive() {
        dump(self.deep.inner.flag);
    }
}