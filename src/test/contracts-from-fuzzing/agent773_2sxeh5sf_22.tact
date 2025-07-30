struct DeepLeaf {
    foo: Int as uint8;
    bar: Bool?;
}

struct DeepMid {
    inner: DeepLeaf?;
    num: Int as int32;
}

struct ComplexState {
    part: DeepMid?;
    flag: Bool?;
    count: Int as uint4;
}

contract ComplexBlob {
    s: ComplexState = ComplexState {
        part: null,
        flag: null,
        count: 7
    };

    init() {
        self.s = ComplexState {
            part: DeepMid {
                inner: DeepLeaf { foo: 1, bar: true },
                num: -1000
            },
            flag: true,
            count: 2
        };
    }

    receive() {}
}