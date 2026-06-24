struct MixedNested {
    topInt: Int;
    middle: MiddleLayer;
    optMiddle: MiddleLayer?;
}

struct MiddleLayer {
    nestedInt: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    value: Int;
    maybe: Int?;
}

contract TestContract {
    data: MixedNested;

    init() {
        self.data = MixedNested{
            topInt: 1,
            middle: MiddleLayer{
                nestedInt: 2,
                inner: InnerStruct{flag: true, value: 3, maybe: null},
            },
            optMiddle: null,
        };
    }
}