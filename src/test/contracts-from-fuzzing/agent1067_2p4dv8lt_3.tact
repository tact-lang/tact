struct DeepNest1 {
    foo: Int;
    bar: Bool;
}

struct DeepNest2 {
    inner: DeepNest1;
    value: String;
}

struct DeepNest3 {
    part: DeepNest2;
    flag: Bool;
}

contract DeepPersistent {
    nested: DeepNest3;

    init() {
        self.nested = DeepNest3{
            part: DeepNest2{
                inner: DeepNest1{
                    foo: 1, bar: true
                },
                value: "test"
            },
            flag: false
        };
    }
}