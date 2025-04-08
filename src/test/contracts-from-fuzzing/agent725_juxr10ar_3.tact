struct DeeplyNested {
    f1: Int;
    f2: Bool;
    f3: Address;
}

struct Container {
    inner: DeeplyNested;
    flag: Bool;
}

struct TopStruct {
    container: Container;
    num: Int;
}

contract Test {
    stored: TopStruct;

    init() {
        self.stored = TopStruct{
            container: Container{
                inner: DeeplyNested{f1: 1, f2: true, f3: myAddress()},
                flag: false
            },
            num: 42
        };
    }
}