struct DeepInner {
    number: Int;
}

struct ContainsInner {
    inner: DeepInner;
}

struct RootStruct {
    c1: ContainsInner;
    c2: ContainsInner;
    flag: Bool;
}

contract DoubleNested {
    state: RootStruct;

    init() {
        self.state = RootStruct{
            c1: ContainsInner{ inner: DeepInner{ number: 11 } },
            c2: ContainsInner{ inner: DeepInner{ number: 22 } },
            flag: true
        };
    }
}