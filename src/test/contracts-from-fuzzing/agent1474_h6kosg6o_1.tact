struct DeepNested {
    i: Int;
    inner: Inner;
}

struct Inner {
    b: Bool;
    opt: Bool?;
    nested2: Inner2;
}

struct Inner2 {
    s: String;
    n: Int?;
}

contract TestContract {
    nested: DeepNested;
    
    init() {
        self.nested = DeepNested{
            i: 1,
            inner: Inner{
                b: true,
                opt: false,
                nested2: Inner2{
                    s: "hi",
                    n: null,
                },
            },
        };
    }
}
