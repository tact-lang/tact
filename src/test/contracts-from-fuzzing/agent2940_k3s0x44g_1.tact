struct SimpleNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    count: Int;
}

contract TestContract {
    s: SimpleNested;

    init() {
        self.s = SimpleNested{inner: InnerStruct{flag: true, count: 1}};
    }
}