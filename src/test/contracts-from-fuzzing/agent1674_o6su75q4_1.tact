struct InnerNested {
    a: Int;
    b: Bool?;
}

struct DeepNested {
    inner: InnerNested;
    flag: Bool;
}

contract TestContract {
    info: DeepNested;
    
    init() {
        self.info = DeepNested{
            inner: InnerNested{
                a: 42,
                b: true,
            },
            flag: false,
        };
    }
}