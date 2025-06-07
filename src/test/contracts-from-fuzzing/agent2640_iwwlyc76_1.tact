struct DeepNested {
    inner: InnerLayer;
}

struct InnerLayer {
    deeper: DeeperLayer;
}

struct DeeperLayer {
    value: Int;
    optionalInner: Innermost?;
}

struct Innermost {
    data: Bool;
}

contract TestContract {
    nestedStruct: DeepNested;

    init() {
        self.nestedStruct = DeepNested{
            inner: InnerLayer{
                deeper: DeeperLayer{
                    value: 123,
                    optionalInner: Innermost{data: true}
                }
            }
        };
    }
}
