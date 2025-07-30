struct SL {
    s: Slice;
}

contract Test {
    data: SL?;

    init() {
        self.data = null;
    }
}