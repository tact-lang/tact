struct SliceOpt {
    data: Slice?;
}

contract SliceOptField {
    val: SliceOpt;

    init() {
        self.val = SliceOpt{ data: null };
    }
}