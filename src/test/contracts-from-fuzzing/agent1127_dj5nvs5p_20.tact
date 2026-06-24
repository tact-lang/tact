struct WithStringSlice {
    s: String;
    sl: Slice;
}

contract StringAndSliceStorage {
    val: WithStringSlice;

    init() {
        self.val = WithStringSlice{
            s: "hello",
            sl: "abc".asSlice(),
        };
    }
}
