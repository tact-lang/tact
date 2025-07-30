struct MixSliceStrBool {
    s: Slice;
    t: String;
    b: Bool;
    os: Slice?;
    ot: String?;
    ob: Bool?;
}

contract MixSliceStrBoolContract {
    rec: MixSliceStrBool;

    init() {
        self.rec = MixSliceStrBool{
            s: emptyCell().asSlice(),
            t: "hello",
            b: true,
            os: null,
            ot: null,
            ob: false
        };
    }
}