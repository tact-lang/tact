struct OneFieldStruct {
    value: Int;
}

struct NestedOnce {
    inside: OneFieldStruct;
}

struct NestedTwice {
    nested: NestedOnce;
}

contract DeepSingleChain {
    chain: NestedTwice;

    init() {
        self.chain = NestedTwice {
            nested: NestedOnce {
                inside: OneFieldStruct { value: 12345 }
            }
        };
    }

    receive() {
        let v = self.chain.nested.inside.value;
    }
}
