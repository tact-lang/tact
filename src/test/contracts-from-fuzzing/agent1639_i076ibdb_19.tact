struct InnerRemainder {
    prefix: Int;
    suffix: Slice as remaining;
}

struct Outer {
    id: Int?;
    nested: InnerRemainder;
    optNested: InnerRemainder?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            id: 1,
            nested: InnerRemainder{
                prefix: 42,
                suffix: "slice1".asComment().asSlice()
            },
            optNested: null
        };
    }
}