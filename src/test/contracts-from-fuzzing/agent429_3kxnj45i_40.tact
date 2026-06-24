struct OptionalSliceStr {
    s: Slice?;
    t: String?;
}

contract OptSliceStr {
    val: OptionalSliceStr;
    init() {
        self.val = OptionalSliceStr{
            s:null,t:null
        };
    }
}
