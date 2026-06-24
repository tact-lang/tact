struct InnerRem {
    rem: Slice as remaining;
}

struct OuterRem {
    foo: Int;
    nested: InnerRem;
    txt: String;
}

contract TestContract {
    data: OuterRem;

    init() {
        self.data = OuterRem{
            foo: 10,
            nested: InnerRem{
                rem: emptyCell().asSlice(),
            },
            txt: "x",
        };
    }
}