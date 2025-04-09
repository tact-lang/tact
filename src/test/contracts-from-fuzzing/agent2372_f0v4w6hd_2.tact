struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    amount: Int;
}

contract TestContract {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            inner: InnerStruct{flag: true, amount: 42}
        };
    }
}