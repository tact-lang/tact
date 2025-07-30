struct NilStructOptional {
    v: Int;
}

contract OptionalStructNull {
    s: NilStructOptional?;

    init() {
        self.s = null;
    }
}