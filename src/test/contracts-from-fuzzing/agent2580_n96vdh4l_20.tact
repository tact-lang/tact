struct DeeplyNested {
    inner1: Int;
    inner2: Bool;
    inner3: String;
    inner4: Address;
    inner5: Bool?;
}

struct Wrapper {
    w1: Int;
    w2: DeeplyNested;
}

contract NestedWrap {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            w1: 7,
            w2: DeeplyNested{
                inner1: 3,
                inner2: true,
                inner3: "xxx",
                inner4: myAddress(),
                inner5: null
            }
        };
    }
}