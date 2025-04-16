// Now test 'remaining' suffix alongside complex serializations
struct MixFormats {
    fixed: Int as int64;
    opt: Int?;
    tail: Slice as remaining;
}

contract RemComplexFormats {
    data: MixFormats;

    init() {
        self.data = MixFormats{
            fixed: 42,
            opt: null,
            tail: emptyCell().asSlice()
        };
    }
}
