struct DeepNested {
    foo: Int;
    bar: Bool;
}

struct L2 {
    inner: DeepNested;
    opt: Int?;
}

struct L1 {
    deep: L2;
    opt2: Bool?;
}

contract Persist {
    data: L1;
    init() {
        self.data = L1{
            deep: L2{
                inner: DeepNested{foo:7, bar:true},
                opt: null
            },
            opt2: null
        };
    }
}
