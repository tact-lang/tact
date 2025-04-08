struct InnerLevel {
    deepValue: Int;
}

struct MidLevel {
    optionalInner: InnerLevel?;
}

contract DeepNestedContract {
    nestedStruct: MidLevel;

    init() {
        self.nestedStruct = MidLevel{ optionalInner: null };
    }
}