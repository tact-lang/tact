struct SliceOpt {
    s: Slice?;
}

contract TestContract {
    val: SliceOpt;

    init() {
        self.val = SliceOpt{s: null};
    }
}